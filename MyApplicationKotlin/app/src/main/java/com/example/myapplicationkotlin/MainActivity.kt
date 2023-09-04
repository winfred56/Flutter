package com.example.myapplicationkotlin

import android.content.Intent
import android.os.Bundle
import android.view.View
import android.widget.Button
import android.widget.EditText
import android.widget.TextView
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        val helloTextView = findViewById<TextView>(R.id.tvHelloWorld)
        val nameTextField = findViewById<EditText>(R.id.etNameInput)
        val continueButton = findViewById<Button>(R.id.btnContinue)
        val offersButton = findViewById<Button>(R.id.btnOffers)
        var enteredName = ""
        continueButton.setOnClickListener {
            if (nameTextField.text.isEmpty()) {
                offersButton.visibility = View.INVISIBLE
                Toast.makeText(this@MainActivity, "Please Enter your name", Toast.LENGTH_SHORT)
                    .show()
            }
            else{
                enteredName = nameTextField.text.toString()
                helloTextView.text = "Welcome $enteredName"
                nameTextField.text.clear()
                offersButton.visibility = View.VISIBLE
            }
        }
        offersButton.setOnClickListener{
            val intent = Intent(this, SecondActivity::class.java)
            intent.putExtra("USERNAME", enteredName)
            startActivity(intent)
        }
    }
}