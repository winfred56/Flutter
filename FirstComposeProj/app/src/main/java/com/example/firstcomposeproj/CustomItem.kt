package com.example.firstcomposeproj

import androidx.compose.animation.animateContentSize
import androidx.compose.animation.core.LinearEasing
import androidx.compose.animation.core.LinearOutSlowInEasing
import androidx.compose.animation.core.animateFloatAsState
import androidx.compose.animation.core.tween
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.KeyboardArrowDown
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.*
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.rotate
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.example.firstcomposeproj.model.Person

@Composable
fun CustomItem(person:Person) {
    var clicked by rememberSaveable { mutableStateOf(false) }
    val rotationState by animateFloatAsState(targetValue = if(clicked) 180f else 0f, label = "")
    Column(
        modifier = Modifier
            .fillMaxWidth()
            .padding(start = 24.dp, end = 24.dp)
            .height(if (clicked) 80.dp else 50.dp)
            .background(color = Color.LightGray, shape = RoundedCornerShape(5.dp))
            .animateContentSize(
                animationSpec = tween(
                    durationMillis = 1000,
                    easing = LinearOutSlowInEasing
                )
            ),
    ) {
        Row(
            verticalAlignment = Alignment.CenterVertically,
        ) {
            Text(
                text = person.id.toString(),
                style = MaterialTheme.typography.headlineLarge.plus(TextStyle(fontWeight = FontWeight.Bold)),
                modifier = Modifier
                    .padding(start = 10.dp)
                    .weight(1f)
            )
            Spacer(modifier = Modifier.width(15.dp))
            Text(
                text = "${person.firstName} ${person.lastName}",
                modifier = Modifier.weight(4f),
                style = MaterialTheme.typography.bodyMedium
            )
            IconButton(onClick = {
                clicked = !clicked
            }, modifier = Modifier
                .weight(1f)
                .rotate(rotationState)) {
                Icon(
                    imageVector = Icons.Default.KeyboardArrowDown,
                    contentDescription = "Down Arrow"
                )
            }
        }
        if (clicked)
            Text(text = "${person.firstName} is ${person.age} years old", Modifier.padding(start = 15.dp), style = MaterialTheme.typography.bodySmall.plus(
                TextStyle(fontWeight = FontWeight.Light)
            ))
    }
}


@Composable
@Preview
private fun CustomItemPreview() {
    CustomItem(Person(1, "Mike", "Dean", 20))
}