import speech_recognition as sr
import mysql.connector

# Establece la conexión a la base de datos
conexion = mysql.connector.connect(
    host="127.0.0.1",
    user="root",
    password="",
    database="myapi"
)

# Función para obtener las notas de un estudiante
def obtener_notas_estudiante(id_estudiante):
    # Crea un cursor para ejecutar las consultas
    cursor = conexion.cursor()

    # Define la consulta SQL con el ID del estudiante ingresado
    consulta = """
        SELECT c.nombre, e.definitiva
        FROM t_alum a
        JOIN t_evaluacion e ON a.id = e.id_alum
        JOIN t_curso c ON a.cod_curso = c.cod
        WHERE a.id = %s
    """

    # Ejecuta la consulta con el ID del estudiante como parámetro
    cursor.execute(consulta, (id_estudiante,))

    # Obtiene el resultado de la consulta
    resultados = cursor.fetchall()

    # Cierra el cursor
    cursor.close()

    # Retorna el resultado de la consulta
    return resultados

# Crear un objeto de reconocimiento de voz
r = sr.Recognizer()

# Utilizar el micrófono como fuente de audio
with sr.Microphone() as source:
    print("Di algo...")
    r.adjust_for_ambient_noise(source)

    # Capturar el audio del micrófono
    audio = r.listen(source)

    # Imprimir un mensaje para indicar que se ha capturado el audio
    print("Audio capturado")

    try:
        # Reconocer el comando de voz
        texto = r.recognize_google(audio, language="es-ES")
        print("Has dicho:", texto)

        # Verificar si el comando es para obtener las notas de un estudiante
        if "notas" in texto.lower():
            # Solicitar al usuario ingresar el ID del estudiante
            print("Ingresa el ID del estudiante:")
            id_estudiante = input()

            # Obtener las notas del estudiante desde la base de datos
            notas_estudiante = obtener_notas_estudiante(id_estudiante)

            # Imprimir las notas del estudiante
            if notas_estudiante:
                print("Notas del estudiante:")
                for fila in notas_estudiante:
                    print("Curso:", fila[0])
                    print("Definitiva:", fila[1])
                    print("-" * 30)
            else:
                print("No se encontró un estudiante con el ID ingresado.")

    except sr.UnknownValueError:
        print("No se pudo entender el comando de voz.")
    except sr.RequestError as e:
        print("Error al procesar el comando de voz:", e)

# Cerrar la conexión a la base de datos
conexion.close()
