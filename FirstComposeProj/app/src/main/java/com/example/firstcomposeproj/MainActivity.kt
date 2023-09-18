package com.example.firstcomposeproj

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.ColumnScope
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.width
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.example.firstcomposeproj.ui.theme.FirstComposeProjTheme
import com.example.firstcomposeproj.ui.theme.Typography

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            FirstComposeProjTheme {
                // A surface container using the 'background' color from the theme
                Surface(
                    modifier = Modifier.fillMaxSize(),
                    color = MaterialTheme.colorScheme.background
                ) {
                    Column {
                        Greeting("Android")
                        Text("Winfred is Awesome", style = Typography.headlineLarge)
                        CustomItem(text = "Composable @ 1", weight = 1f, width = 400)
                        CustomItem(text = "Composable @ 2", weight = 2f, width = 300, color = MaterialTheme.colorScheme.error)
                        CustomItem(text = "Composable @ 3", weight = 1f, width = 200)

                    }
                }
            }
        }
    }
}

@Composable
fun Greeting(name: String, modifier: Modifier = Modifier) {
    Text(
        text = "Hello $name!",
        modifier = modifier
    )
}

@Composable
fun ColumnScope.CustomItem(text: String, weight:Float, width: Int, color: Color = MaterialTheme.colorScheme.onBackground){
    Surface(modifier = Modifier
        .weight(weight)
        .width(width.dp)){
        Text(text = text, style = Typography.titleLarge.copy(color = color.apply { color.blue }))
    }
}

@Preview(showBackground = true)
@Composable
fun GreetingPreview() {
    FirstComposeProjTheme {
        Column(modifier = Modifier.fillMaxSize(), verticalArrangement = Arrangement.Center){
            CustomItem(text = "Composable @ 1", weight = 1f, width = 400)
            Surface(modifier = Modifier
                .weight(2f)
                .width(300.dp), color = MaterialTheme.colorScheme.secondary) {
                Text("Column @ 2")
            }
            Surface(modifier = Modifier
                .weight(2f)
                .width(200.dp), color = MaterialTheme.colorScheme.error) {
                Text("Column @ 3")
            }
        }
    }
}