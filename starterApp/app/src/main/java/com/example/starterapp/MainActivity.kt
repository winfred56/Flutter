package com.example.starterapp

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.TextView
import androidx.lifecycle.ViewModelProvider
import com.google.android.material.floatingactionbutton.FloatingActionButton

class MainActivity : AppCompatActivity() {
    /// Initialize necessary variables
    private lateinit var textCount : TextView
    private lateinit var fabBtn : FloatingActionButton
    private lateinit var viewModel:MainActivityViewModel
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        /// Assign values to variables onCreate
        fabBtn = findViewById(R.id.floatingActionButton)
        textCount = findViewById(R.id.tvCount)
        viewModel = ViewModelProvider(this)[MainActivityViewModel::class.java]
        textCount.text = viewModel.count.toString()
        fabBtn.setOnClickListener{
            viewModel.updateCount()
            textCount.text = viewModel.count.toString()
        }
    }
}