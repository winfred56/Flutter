package com.example.studentregister

import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import androidx.appcompat.app.AppCompatActivity
import androidx.lifecycle.ViewModelProvider
import com.example.studentregister.db.Student
import com.example.studentregister.db.StudentDatabase

class MainActivity : AppCompatActivity() {
    private lateinit var editNameText: EditText
    private lateinit var editEmailText: EditText
    private lateinit var saveButton: Button
    private lateinit var clearButton: Button

    private lateinit var viewModel: StudentViewModel
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        editNameText = findViewById(R.id.etStudentName)
        editEmailText = findViewById(R.id.etStudentEmail)
        saveButton = findViewById(R.id.btnSave)
        clearButton = findViewById(R.id.btnClear)

        val dao = StudentDatabase.getInstance(application).studentDao()
        val factory = StudentViewModelFactory(dao)
        viewModel = ViewModelProvider(this, factory)[StudentViewModel::class.java]

        saveButton.setOnClickListener {
            saveStudentData()
            clearInput()
        }

        clearButton.setOnClickListener{
            clearInput()
        }
    }

    private fun saveStudentData() {
        viewModel.insertStudent(
            Student(0, editNameText.text.toString(), editEmailText.text.toString())
        )
    }
    private fun clearInput() {
        editEmailText.setText("")
        editNameText.setText("")
    }
}