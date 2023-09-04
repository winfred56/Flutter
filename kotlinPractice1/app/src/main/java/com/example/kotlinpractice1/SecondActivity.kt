package com.example.kotlinpractice1

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.TextView

class SecondActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_second)
        val username = intent.getStringExtra("NAME")
        val backBtn = findViewById<Button>(R.id.btnBack)
        val text = findViewById<TextView>(R.id.textView)
        text.text = "Welcome $username,\nYou can press the back button to return to the previous page"

        backBtn.setOnClickListener {
            // startActivity(Intent(this, MainActivity::class.java))
            finish()
        }
    }

}