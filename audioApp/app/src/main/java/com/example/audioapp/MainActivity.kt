package com.example.audioapp

import android.media.MediaPlayer
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.os.Handler
import android.util.Log
import android.widget.SeekBar
import android.widget.TextView
import com.google.android.material.floatingactionbutton.FloatingActionButton
import java.util.concurrent.TimeUnit
import kotlin.time.toDuration

class MainActivity : AppCompatActivity() {
    private lateinit var seekBar: SeekBar
    private var mediaPlayer: MediaPlayer? = null
    private val handler = Handler()
    private lateinit var timePlayed: TextView
    private lateinit var runnable: Runnable
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        var paused = false
        seekBar = findViewById(R.id.seekBar)
        mediaPlayer = MediaPlayer.create(this, R.raw.applaud)
        var audioDuration = findViewById<TextView>(R.id.tvDuration)
        timePlayed = findViewById(R.id.tvTimePlayed)
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
                handler.postDelayed(updateTimePlayed, 1000)
                initializeSeekBar()

            }
        }

        mediaPlayer!!.setOnCompletionListener {
            // Media playback has finished
            fabPlay.setImageResource(R.drawable.baseline_play)
            paused = false
            handler.removeCallbacks(updateTimePlayed)
        }

        fabRewind.setOnClickListener{
            mediaPlayer!!.seekTo(mediaPlayer!!.currentPosition - 5000)
        }

        fabForward.setOnClickListener{
            mediaPlayer!!.seekTo(mediaPlayer!!.currentPosition + 5000)
        }

    }
    private val updateTimePlayed: Runnable = object : Runnable {
        override fun run() {
            seekBar.max = mediaPlayer!!.duration
            val currentPosition = mediaPlayer!!.currentPosition
            seekBar.progress = mediaPlayer!!.currentPosition
            val timePlayedInSeconds = TimeUnit.MILLISECONDS.toSeconds(currentPosition.toLong())
            val formattedTimePlayed = formatSecondsToTime(timePlayedInSeconds.toInt())
            timePlayed.text = formattedTimePlayed
            handler.postDelayed(this, 1000) // Schedule the next update in 1 second
        }
    }

    override fun onDestroy() {
        super.onDestroy()
        mediaPlayer?.release()
        handler.removeCallbacks(updateTimePlayed)
    }
    private fun formatSecondsToTime(seconds: Int): String {
        val minutes = seconds / 60
        val remainingSeconds = seconds % 60
        return String.format("%d:%02d", minutes, remainingSeconds)
    }

    private fun initializeSeekBar(){
        seekBar.setOnSeekBarChangeListener(object: SeekBar.OnSeekBarChangeListener{
            override fun onProgressChanged(seekBar: SeekBar?, progress: Int, fromUser: Boolean) {
                if(fromUser) mediaPlayer!!.seekTo(progress)
            }

            override fun onStartTrackingTouch(p0: SeekBar?) {
            }

            override fun onStopTrackingTouch(p0: SeekBar?) {
            }

        })


    }
}