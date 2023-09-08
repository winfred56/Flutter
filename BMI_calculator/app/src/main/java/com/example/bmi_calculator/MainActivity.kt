package com.example.bmi_calculator

import android.graphics.Color
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import android.widget.TextView
import android.widget.Toast
import androidx.core.content.ContextCompat

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        val weightText = findViewById<EditText>(R.id.etWeightNumber)
        val heightText = findViewById<EditText>(R.id.etHeightNumber)
        val calcBtn = findViewById<Button>(R.id.btmCalc)
        calcBtn.setOnClickListener {
            val weight = weightText.text.toString()
            val height = heightText.text.toString()
            if(weight.isNullOrEmpty() || height.isNullOrEmpty()){
                Toast.makeText(this, "Input fields cannot be empty", Toast.LENGTH_SHORT).show()
            }
            else{
                val bmi = weight.toFloat()/((height.toFloat()/100)*(height.toFloat()/100))
                val bmi2Digits = String.format("%.2f", bmi).toFloat()
                displayResults(bmi2Digits)
            }
        }
    }
    private fun displayResults(bmi: Float){
        val resultIndex = findViewById<TextView>(R.id.tvIndex)
        val resultDescription = findViewById<TextView>(R.id.tvResults)
        val info = findViewById<TextView>(R.id.tvInfo)
        resultIndex.text = bmi.toString()
        info.text = "Normal range is 18.5 - 24.9"
        var resultText = ""
        var color = 0;
        when {
            bmi < 18.5 -> {
                resultText = "Underweight"
                color = R.color.under_weight
            }
            bmi in 18.5..24.99-> {
                resultText = "Healthy "
                color = R.color.normal
            }
            bmi in 25.00..29.99 -> {
                resultText = "Overweight"
                color = R.color.over_weight
            }
            bmi > 29.99 -> {
                resultText = "Obese"
                color = R.color.obese
            }
        }
        resultDescription.setTextColor(ContextCompat.getColor(this, color))
        resultDescription.text = resultText

    }
}