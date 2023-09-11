package com.example.audioapp

import android.media.MediaPlayer
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.widget.TextView
import com.google.android.material.floatingactionbutton.FloatingActionButton
import kotlin.time.toDuration

class MainActivity : AppCompatActivity() {
    /// Instance of MediaPlayer
    private var mediaPlayer: MediaPlayer? = null
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        var paused = false
        /// Initialize Player
        mediaPlayer = MediaPlayer.create(this, R.raw.applaud)
        var audioDuration = findViewById<TextView>(R.id.tvDuration)
        var fabPlay = findViewById<FloatingActionButton>(R.id.fabPlay)
        val fabRewind = findViewById<FloatingActionButton>(R.id.fabRewind)
        val fabForward = findViewById<FloatingActionButton>(R.id.fabForward)

        val formatDurationTime = formatSecondsToTime((mediaPlayer!!.duration/1000))
        audioDuration.text = formatDurationTime
        fabPlay.setOnClickListener{
            paused = !paused
            if(!paused){
                fabPlay.setImageResource(R.drawable.baseline_play)
                mediaPlayer!!.pause()
            }
            else{
                fabPlay.setImageResource(R.drawable.baseline_pause)
                mediaPlayer!!.start()
            }
        }
        fabRewind.setOnClickListener{
            mediaPlayer!!.seekTo(-5000)
        }
        fabForward.setOnClickListener{
            mediaPlayer!!.seekTo(5000)
        }
    }
    private fun formatSecondsToTime(seconds: Int): String {
        val minutes = seconds / 60
        val remainingSeconds = seconds % 60
        return String.format("%d:%02d", minutes, remainingSeconds)
    }
}