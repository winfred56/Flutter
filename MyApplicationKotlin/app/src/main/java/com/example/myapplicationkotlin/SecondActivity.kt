package com.example.myapplicationkotlin

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.TextView

class SecondActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_second)
        val incomingName = intent.getStringExtra("USERNAME")
        val nameTextView = findViewById<TextView>(R.id.textViewName)
        nameTextView.text = "$incomingName, You are on Free Trial"
    }
}