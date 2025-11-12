import com.google.gson.Gson
import kotlinx.cli.*
import model.User

fun main(args: Array<String>) {
    val parser = ArgParser("demo")

    val name by parser.option(
        ArgType.String,
        shortName = "n",
        description = "Ваше имя"
    )

    val verbose by parser.option(
        ArgType.Boolean,
        shortName = "v",
        description = "Включить подробный вывод"
    ).default(false)

    parser.parse(args)

    if (name != null) {
        val gson = Gson()
        val user = User(name!!)
        println("Привет, ${gson.toJson(user)}!")
    } else {
        println("Привет, незнакомец!")
    }

    if (verbose) {
        println("Запущено с аргументами: ${args.joinToString(" ")}")
    }
}
