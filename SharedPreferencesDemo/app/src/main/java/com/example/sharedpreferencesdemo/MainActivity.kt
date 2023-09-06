package com.example.sharedpreferencesdemo

import android.content.SharedPreferences
import android.content.SharedPreferences.Editor
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.EditText

class MainActivity : AppCompatActivity() {
    private lateinit var name:EditText
    private lateinit var age:EditText
    private lateinit var sf: SharedPreferences
    private lateinit var editor: Editor
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        name = findViewById(R.id.etName)
        age = findViewById(R.id.etAge)
        sf = getSharedPreferences("my_sf", MODE_PRIVATE)
        editor = sf.edit()
    }

    override fun onPause() {
        super.onPause()
        /// retrieve user inputs values
        val nameInputValue = name.text.toString()
        val ageInputValue = age.text.toString().toInt()
        /// Save user input values to shared preferences
        editor.apply{
            putString("sf_name", nameInputValue)
            putInt("sf_age", ageInputValue)
            commit()
        }
    }

    override fun onResume() {
        super.onResume()
        val retrievedName = sf.getString("sf_name", null)
        val retrievedAge = sf.getInt("sf_age", 0)
        name.setText(retrievedName)
        if(retrievedAge != 0){
            age.setText(retrievedAge.toString())
        }


    }
}