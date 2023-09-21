package com.example.firstcomposeproj.repository

import com.example.firstcomposeproj.model.Person

class PersonRepository {
    fun getAllData(): List<Person>{
        return listOf(
            Person(1, "John", "Doe", 18 ),
            Person(2, "Smith", "Rowe", 21 ),
            Person(3, "Marcus", "Rashford", 23 ),
            Person(4, "Jadon", "Sancho", 23 ),
            Person(5, "Alphonso", "Davies", 22 ),
            Person(6, "Joshua", "Kimmich", 28 ),
            Person(7, "Kylian", "Mbappe", 29 ),
            Person(8, "Bruno", "Fernandes", 32 ),
            Person(9, "Trent", "Alexander-Arnold", 24 ),
            Person(10, "Mohammed", "Salah", 32 ),
            Person(11, "Phil", "Foden", 32 ),
            Person(12, "Bernardo", "Silva", 32 ),
            Person(13 , "John", "Stones", 32 ),
        )
    }
}