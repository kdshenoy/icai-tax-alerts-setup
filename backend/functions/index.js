const functions = require('firebase-functions');
const admin     = require('firebase-admin');
const fetch     = require('node-fetch');
admin.initializeApp();

const DB     = admin.firestore();
const COL    = 'latestIds';
const DOC_ID = 'taxAlerts';

async function scrapeId(url, regex) {
  const res  = await fetch(url);
  const txt  = await res.text();
  const m    = txt.match(new RegExp(regex+'([0-9]+)'));
  return m ? m[1] : null;
}

exports.checkTaxUpdates = 
  functions.pubsub.schedule('every 5 minutes').onRun(async () => {
    const ref = DB.collection(COL).doc(DOC_ID);
    const snap = await ref.get();
    const { incomeTaxId, gstId } = snap.exists ? snap.data() : {};

    const newIncome = await scrapeId('https://incometax.gov.in/...','circular-id-');
    const newGst    = await scrapeId('https://gst.gov.in/...',    'gst-notif-');

    const toNotify = [];
    if (newIncome && newIncome!==incomeTaxId) {
      toNotify.push({ topic:'incomeTax', title:'New IT Update', body:ID  });
      await ref.update({ incomeTaxId: newIncome });
    }
    if (newGst && newGst!==gstId) {
      toNotify.push({ topic:'gst', title:'New GST Update', body:ID  });
      await ref.update({ gstId: newGst });
    }

    await Promise.all(toNotify.map(n =>
      admin.messaging().send({
        notification: { title: n.title, body: n.body },
        topic:        n.topic
      })
    ));
    return null;
});
