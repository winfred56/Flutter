package com.example.recyclerviewdemo

import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import android.widget.Toast
import androidx.recyclerview.widget.RecyclerView

class MyRecyclerViewAdapter(private val names: List<Pupils>, private val myClickListener: (Pupils) -> Unit) : RecyclerView.Adapter<MyRecyclerViewHolder>(){

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): MyRecyclerViewHolder {
        val layoutInflater = LayoutInflater.from(parent.context)
        val listItem = layoutInflater.inflate(R.layout.list_item, parent, false)
        return MyRecyclerViewHolder(listItem)
    }

    override fun getItemCount(): Int {
        return names.size
    }

    override fun onBindViewHolder(holder: MyRecyclerViewHolder, position: Int) {
        holder.bind(names[position], myClickListener)
    }
}

class MyRecyclerViewHolder(private val view: View) : RecyclerView.ViewHolder(view){
    fun bind(pupils: Pupils, myClickListener: (Pupils) -> Unit){
        val myTextView: TextView = view.findViewById(R.id.tvName)
        myTextView.text = "${pupils.name} is ${pupils.age}"
        view.setOnClickListener{
            myClickListener(pupils)
        }
    }
}