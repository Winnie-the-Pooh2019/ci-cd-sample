package model

import com.google.gson.annotations.SerializedName

data class User(
    @SerializedName("user_name")
    private val name: String,
)
