// Thin SDL_mixer wrapper matching the way Paladog uses flash.media.Sound:
// a few music tracks (one audible at a time) and 26 rotating effect channels.
#pragma once

#include <string>
#include <vector>

struct Mix_Chunk;

class Audio {
public:
    bool init(int effectChannels);
    void shutdown();
    bool ok() const { return ok_; }

    // Sounds are identified by their EMBEDSND index (assets/audio/snd_<n>.mp3).
    bool loadMusic(int slot, const std::string& path);
    bool loadEffect(int slot, const std::string& path);

    // loops < 0 => loop forever.
    void playMusic(int slot, bool loop);
    void stopMusic();
    void pauseMusic();
    void resumeMusic();
    void setMusicVolume(double v);   // 0..1

    // Plays on an explicit channel (Flash code rotates channels itself).
    // `times` = number of plays (Flash Sound.play loops argument; 0 or 1 => once).
    void playEffect(int channel, int slot, int times);
    void stopChannel(int channel);
    void stopAllChannels();
    void setChannelVolume(int channel, double v);  // 0..1

private:
    bool ok_ = false;
    std::vector<void*> music_;  // Mix_Music* (struct tag differs across SDL_mixer versions)
    std::vector<Mix_Chunk*> effects_;
};
