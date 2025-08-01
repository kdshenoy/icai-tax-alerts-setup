package com.icaitaxalerts

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import com.google.firebase.messaging.FirebaseMessaging
import org.jsoup.Jsoup
import kotlinx.coroutines.*

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        // Subscribe to topics
        FirebaseMessaging.getInstance().subscribeToTopic("incomeTax")
        FirebaseMessaging.getInstance().subscribeToTopic("gst")

        // TODO: scraping logic with Jsoup + show notifications
        GlobalScope.launch {
            val doc = Jsoup.connect("https://incometax.gov.in/...").get()
            val latest = doc.select("a.circular-id").first().text()
            // call Firestore via REST or via Kotlin SDK
        }
    }
}
