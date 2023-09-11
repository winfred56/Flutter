package com.example.clapapp

import android.media.MediaPlayer
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.util.Log
import android.widget.Button
import android.widget.SeekBar
import android.widget.TextView
import com.google.android.material.floatingactionbutton.FloatingActionButton

class MainActivity : AppCompatActivity() {
    /// Instance of Seekbar
    private lateinit var seekBar: SeekBar
    /// Instance of MediaPlayer
    private var mediaPlayer: MediaPlayer? = null
    private lateinit var runnable: Runnable
    private lateinit var handler: Handler
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        mediaPlayer = MediaPlayer.create(this,R.raw.applaud)  /// Initialize the media player
        seekBar = findViewById(R.id.seekBar2)
        handler = Handler(Looper.getMainLooper())
        val clapBtn = findViewById<FloatingActionButton>(R.id.btnClap)
        val pauseBtn = findViewById<FloatingActionButton>(R.id.btnPause)
        val stopBtn = findViewById<FloatingActionButton>(R.id.btnStop)
        clapBtn.setOnClickListener {
            if(mediaPlayer == null) {
                mediaPlayer = MediaPlayer.create(this,R.raw.applaud)
                initializeSeekbar()
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
            handler.removeCallbacks(runnable)
            seekBar.progress = 0
        }
    }
    private fun initializeSeekbar() {
        seekBar.setOnSeekBarChangeListener(object : SeekBar.OnSeekBarChangeListener {
            override fun onProgressChanged(seekBar: SeekBar?, progress: Int, fromUser: Boolean) {
                if(fromUser) mediaPlayer?.seekTo(progress)
            }

            override fun onStartTrackingTouch(p0: SeekBar?) {

            }

            override fun onStopTrackingTouch(p0: SeekBar?) {
            }
        })
        var timeRemaining = findViewById<TextView>(R.id.tvRemainTime)
        var timePlayed = findViewById<TextView>(R.id.tvPlayedTime)
        seekBar.max = mediaPlayer!!.duration
        runnable = Runnable {
            val played = mediaPlayer!!.currentPosition/1000
            timePlayed.text = "$played seconds"
            println()
            val duration = (mediaPlayer!!.duration/100) - played
            timeRemaining.text = "$duration seconds"
            println("${timePlayed.text} ==== ")
            println("${timeRemaining.text}")
            Log.i("Information", "initializeSeekbar: ${timeRemaining.text}")
            Log.i("Information", "initializeSeekbar: ${timePlayed.text}")
            seekBar.progress = mediaPlayer!!.currentPosition
            handler.postDelayed(runnable, 1000)
        }
        handler.postDelayed(runnable, 1000)
    }
}