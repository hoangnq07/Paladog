#include "audio.h"

#include <SDL.h>
#include <SDL_mixer.h>

#include <algorithm>

bool Audio::init(int effectChannels) {
    const int flags = MIX_INIT_MP3;
    if ((Mix_Init(flags) & flags) != flags) {
        SDL_Log("Mix_Init(MP3) failed: %s", Mix_GetError());
    }
    if (Mix_OpenAudio(44100, MIX_DEFAULT_FORMAT, 2, 1024) != 0) {
        SDL_Log("Mix_OpenAudio failed: %s (continuing without sound)", Mix_GetError());
        ok_ = false;
        return false;
    }
    Mix_AllocateChannels(effectChannels);
    ok_ = true;
    return true;
}

void Audio::shutdown() {
    if (!ok_) return;
    Mix_HaltChannel(-1);
    Mix_HaltMusic();
    for (auto* m : music_) if (m) Mix_FreeMusic(static_cast<Mix_Music*>(m));
    for (auto* c : effects_) if (c) Mix_FreeChunk(c);
    music_.clear();
    effects_.clear();
    Mix_CloseAudio();
    Mix_Quit();
    ok_ = false;
}

bool Audio::loadMusic(int slot, const std::string& path) {
    if (!ok_ || slot < 0) return false;
    if (static_cast<int>(music_.size()) <= slot) music_.resize(slot + 1, nullptr);
    if (music_[slot]) Mix_FreeMusic(static_cast<Mix_Music*>(music_[slot]));
    music_[slot] = Mix_LoadMUS(path.c_str());
    if (!music_[slot]) SDL_Log("Mix_LoadMUS(%s): %s", path.c_str(), Mix_GetError());
    return music_[slot] != nullptr;
}

bool Audio::loadEffect(int slot, const std::string& path) {
    if (!ok_ || slot < 0) return false;
    if (static_cast<int>(effects_.size()) <= slot) effects_.resize(slot + 1, nullptr);
    if (effects_[slot]) Mix_FreeChunk(effects_[slot]);
    effects_[slot] = Mix_LoadWAV(path.c_str());
    if (!effects_[slot]) SDL_Log("Mix_LoadWAV(%s): %s", path.c_str(), Mix_GetError());
    return effects_[slot] != nullptr;
}

void Audio::playMusic(int slot, bool loop) {
    if (!ok_ || slot < 0 || slot >= static_cast<int>(music_.size()) || !music_[slot]) return;
    Mix_PlayMusic(static_cast<Mix_Music*>(music_[slot]), loop ? -1 : 0);
}

void Audio::stopMusic() {
    if (ok_) Mix_HaltMusic();
}

void Audio::pauseMusic() {
    if (ok_) Mix_PauseMusic();
}

void Audio::resumeMusic() {
    if (ok_) Mix_ResumeMusic();
}

void Audio::setMusicVolume(double v) {
    if (ok_) Mix_VolumeMusic(static_cast<int>(std::clamp(v, 0.0, 1.0) * MIX_MAX_VOLUME + 0.5));
}

void Audio::playEffect(int channel, int slot, int times) {
    if (!ok_ || slot < 0 || slot >= static_cast<int>(effects_.size()) || !effects_[slot]) return;
    const int loops = times > 1 ? times - 1 : 0;
    Mix_PlayChannel(channel, effects_[slot], loops);
}

void Audio::stopChannel(int channel) {
    if (ok_) Mix_HaltChannel(channel);
}

void Audio::stopAllChannels() {
    if (ok_) Mix_HaltChannel(-1);
}

void Audio::setChannelVolume(int channel, double v) {
    if (ok_) Mix_Volume(channel, static_cast<int>(std::clamp(v, 0.0, 1.0) * MIX_MAX_VOLUME + 0.5));
}
