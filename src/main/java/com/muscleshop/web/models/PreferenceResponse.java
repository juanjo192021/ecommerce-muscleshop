package com.muscleshop.web.models;

public class PreferenceResponse {
    private String preferenceId;
    private Integer preferenceValue;

    public PreferenceResponse() {}

    public PreferenceResponse(String preferenceId, Integer preferenceValue) {
        this.preferenceId = preferenceId;
        this.preferenceValue = preferenceValue;
    }

    public String getPreferenceId() {
        return preferenceId;
    }

    public void setPreferenceId(String preferenceId) {
        this.preferenceId = preferenceId;
    }

    public Integer getPreferenceValue() {
        return preferenceValue;
    }

    public void setPreferenceValue(Integer preferenceValue) {
        this.preferenceValue = preferenceValue;
    }
}
