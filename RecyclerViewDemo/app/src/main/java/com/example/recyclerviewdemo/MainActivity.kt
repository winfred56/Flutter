package com.example.recyclerviewdemo

import android.graphics.Color
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Toast
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
        val names: List<Pupils> = listOf(Pupils("Winfred", 20), Pupils("Adu", 18), Pupils("Kwame", 12), Pupils("Kofi", 23), Pupils("Yaw", 32), Pupils("Ama",19), Pupils("Adwoa", 25), Pupils("Yaa", 32), Pupils( "Kwabena", 43), Pupils( "Akwasi", 18) )
        myRecyclerview.adapter = MyRecyclerViewAdapter(names) {
            selectedItem:Pupils -> listItemClicked(selectedItem)
        }
    }
    private fun listItemClicked(pupils: Pupils){
        Toast.makeText(this@MainActivity,"selected: ${pupils.name}", Toast.LENGTH_LONG).show()
    }
}