package com.example.recyclerviewdemo

import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView

class MyRecyclerViewAdapter(private val names: List<String>) : RecyclerView.Adapter<MyRecyclerViewHolder>(){

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): MyRecyclerViewHolder {
        val layoutInflater = LayoutInflater.from(parent.context)
        val listItem = layoutInflater.inflate(R.layout.list_item, parent, false)
        return MyRecyclerViewHolder(listItem)
    }

    override fun getItemCount(): Int {
        return names.size
    }

    override fun onBindViewHolder(holder: MyRecyclerViewHolder, position: Int) {
        holder.myTextView.text = names[position]
    }
}

class MyRecyclerViewHolder(private val view: View) : RecyclerView.ViewHolder(view){
    val myTextView = view.findViewById<TextView >(R.id.tvName)
}