package com.example.kotlinpractice1

import android.content.Intent
import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import android.widget.TextView
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import com.example.kotlinpractice1.R.*

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(layout.activity_main)
        /// Retrieve the UI views
        var username: String
        val editText = findViewById<EditText>(id.etNameField)
        val continueBtn = findViewById<Button>(id.btnContinue)
        val textBtn = findViewById<TextView>(id.password)
        /// Button onPressed action
        continueBtn.setOnClickListener {
            if (editText.text.isNotEmpty()) {
                username = editText.text.toString()
                /// Navigation to SecondActivity
                val intent = Intent(this, SecondActivity::class.java)
                intent.putExtra("NAME", username)
                startActivity(intent)
            } else {
                Toast.makeText(this@MainActivity, "Please enter your username", Toast.LENGTH_SHORT)
                    .show()
            }
        }
        textBtn.setOnClickListener {
            println("TextBtn is working =========== ")
        }
    }
}