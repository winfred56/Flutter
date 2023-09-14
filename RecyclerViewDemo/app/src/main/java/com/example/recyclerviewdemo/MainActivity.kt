package com.example.recyclerviewdemo

import android.graphics.Color
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView

class MainActivity : AppCompatActivity() {
    lateinit var myRecyclerview : RecyclerView
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        myRecyclerview = findViewById(R.id.myRecyclerView)
        myRecyclerview.setBackgroundColor( Color.WHITE)
        myRecyclerview.layoutManager = LinearLayoutManager(this)
        val names: List<String> = listOf("Winfred", "Adu", "Kwame", "Kofi", "Yaw", "Ama", "Adwoa", "Yaa", "Kwaku", "Kwabena", "Abena", "Akwasi", "Akosua", "Lady", "Niki", "Fred", "Emma", "Joe", "Biden", "Macalester")
        myRecyclerview.adapter = MyRecyclerViewAdapter(names)
    }
}