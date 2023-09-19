package com.example.firstcomposeproj

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxHeight
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.safeContentPadding
import androidx.compose.foundation.layout.width
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Surface
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp

@Composable
fun ColumnsAndRows(){
    Column(
        modifier = Modifier.safeContentPadding(),
        verticalArrangement = Arrangement.SpaceBetween
    ) {
        Surface(
            modifier = Modifier
                .fillMaxWidth()
                .padding(top = 8.dp)
                .height(100.dp), color = MaterialTheme.colorScheme.primary
        ) {

        }
        Surface(
            modifier = Modifier
                .fillMaxWidth()
                .padding(top = 8.dp)
                .height(100.dp), color = MaterialTheme.colorScheme.error
        ) {

        }
        Surface(
            modifier = Modifier
                .fillMaxWidth()
                .padding(top = 8.dp)
                .height(100.dp), color = MaterialTheme.colorScheme.primary
        ) {

        }

        Row(
            modifier = Modifier
                .fillMaxHeight()
                .fillMaxWidth()
                .padding(top = 8.dp),
            horizontalArrangement = Arrangement.SpaceBetween
        ) {
            Surface(
                modifier = Modifier
                    .fillMaxHeight()
                    .width(125.dp),
                color = MaterialTheme.colorScheme.primary
            ) {}
            Surface(
                modifier = Modifier
                    .fillMaxHeight()
                    .width(125.dp),
                color = MaterialTheme.colorScheme.error
            ) {}
            Surface(
                modifier = Modifier
                    .fillMaxHeight()
                    .width(125.dp),
                color = MaterialTheme.colorScheme.primary
            ) {}
        }
    }
}