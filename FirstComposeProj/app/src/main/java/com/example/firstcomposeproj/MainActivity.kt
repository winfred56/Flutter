package com.example.firstcomposeproj

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.example.firstcomposeproj.repository.PersonRepository
import com.example.firstcomposeproj.ui.theme.FirstComposeProjTheme

class MainActivity : ComponentActivity() {
    @OptIn(ExperimentalMaterial3Api::class)
    override fun onCreate(savedInstanceState: Bundle?) {
        val personData = PersonRepository().getAllData()
        super.onCreate(savedInstanceState)
        setContent {
            FirstComposeProjTheme {
                Column()
                {
                    ExpandableCard()
                    CustomTextField()
                    CoilImage()
                    PasswordTextField()
                    GradientButton(
                        text = "Save", gradient = Brush.horizontalGradient(
                            colors = listOf(
                                Color.Red, Color.Green
                            )
                        )
                    )
                    LazyColumn(
                        verticalArrangement = Arrangement.spacedBy(10.dp)
                    ) {
                        items(personData) { person ->
                            CustomItem(person = person)
                        }
                    }
                }

            }
        }

    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Preview(showBackground = true)
@Composable
fun GreetingPreview() {
    Column(
        modifier = Modifier.fillMaxSize(),
        verticalArrangement = Arrangement.Center,
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        ExpandableCard()
        CustomTextField()
    }
}