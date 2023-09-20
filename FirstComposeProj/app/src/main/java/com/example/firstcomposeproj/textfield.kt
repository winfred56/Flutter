package com.example.firstcomposeproj

import android.util.Log
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.text.KeyboardActions
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Email
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Icon
import androidx.compose.material3.Text
import androidx.compose.material3.TextField
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.input.ImeAction
import androidx.compose.ui.text.input.KeyboardType
import androidx.compose.ui.unit.dp

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun CustomTextField(){
    var textController by remember { mutableStateOf("Type your name") }
    TextField(
        value = textController,
        onValueChange = { newText -> textController = newText },
        label = { Text("Email") },
        modifier = Modifier.padding(top = 5.dp),
        leadingIcon = {
            Icon(imageVector = Icons.Default.Email, contentDescription = "Email")
        },
        keyboardOptions = KeyboardOptions(
            imeAction = ImeAction.Send,
            keyboardType = KeyboardType.Text,
            autoCorrect = true
        ),
        keyboardActions = KeyboardActions(
            onSend = {
                // Handle the send action
                Log.d("KEYBOARD_ACTION", "Send button clicked")
            },
            onDone = {
                // Handle the done action (optional)
                Log.d("KEYBOARD_ACTION", "Done button clicked")
            }
        )
    )
}