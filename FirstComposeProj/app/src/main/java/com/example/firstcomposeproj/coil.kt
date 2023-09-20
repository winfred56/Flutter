package com.example.firstcomposeproj

import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.width
import androidx.compose.material3.CircularProgressIndicator
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.unit.dp
import coil.compose.AsyncImagePainter
import coil.compose.ImagePainter
import coil.compose.rememberAsyncImagePainter
import coil.compose.rememberImagePainter
import coil.request.ImageRequest

@Composable
fun CoilImage(){
    Box(
        modifier = Modifier
            .width(150.dp)
            .height(150.dp),
        contentAlignment = Alignment.Center
    ){
        val painter = rememberAsyncImagePainter(
            ImageRequest.Builder(LocalContext.current).data(data = "https://avatars.githubusercontent.com/u/14994036?v=4").apply(block = fun ImageRequest.Builder.() {

            }).build()
        )
        Image(painter = painter, contentDescription = "pic")
        val painterState = painter.state
        if(painterState is AsyncImagePainter.State.Loading)
            CircularProgressIndicator()
    }
}

