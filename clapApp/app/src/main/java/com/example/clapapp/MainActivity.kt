package com.example.clapapp

import android.media.MediaPlayer
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import com.google.android.material.floatingactionbutton.FloatingActionButton

class MainActivity : AppCompatActivity() {
    /// Instance of MediaPlayer
    private var mediaPlayer: MediaPlayer? = null
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        mediaPlayer = MediaPlayer.create(this,R.raw.applaud)  /// Initialize the media player
        val clapBtn = findViewById<FloatingActionButton>(R.id.btnClap)
        val pauseBtn = findViewById<FloatingActionButton>(R.id.btnPause)
        val stopBtn = findViewById<FloatingActionButton>(R.id.btnStop)
        clapBtn.setOnClickListener {
            if(mediaPlayer == null) {
                mediaPlayer = MediaPlayer.create(this,R.raw.applaud)
            }else{
                mediaPlayer!!.start()
            }
        }
        pauseBtn.setOnClickListener {
            mediaPlayer?.pause()

        }
        stopBtn.setOnClickListener {
            mediaPlayer?.stop()
            mediaPlayer?.reset()
            mediaPlayer?.release()
            mediaPlayer = null
        }
    }
}