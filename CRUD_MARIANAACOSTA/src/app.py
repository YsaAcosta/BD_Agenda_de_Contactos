from flask import Flask, render_template, request , redirect, url_for
import os
import database as db

templates_dir = os.path.dirname(os.path.abspath(os.path.dirname(__file__)))

templates_dir = os.path.join(templates_dir, 'src', 'templades')

app = Flask(__name__, template_folder = "templates")

#rutas del la aplicacion
@app.route('/')
def home():

    cursor = db.database.cursor()
    cursor.execute("SELECT * FROM contacto")
    myresult = cursor.fetchall()
    #Convertir los datos a Diccionario 
    insertObject = []
    columnNames = [column[0] for column in  cursor.description]
    for record in myresult:
        insertObject .append(dict(zip(columnNames, record )))
    cursor.close()
    

    return render_template('index.html', data = insertObject)

@app.route("/contacto",methods = ["POST","GET"])
def post():
    if request.method == "POST":
        
        Nombre_Contacto = request.form['Name']
        Apellido_Contacto = request.form['Apellido']
        Telefono = request.form['Telefono']
        Email = request.form['Email']
        Fecha_nacimiento = request.form ['Fecha']

    if Nombre_Contacto and Apellido_Contacto and Email and Telefono and Fecha_nacimiento:
        cursor  =db.database.cursor()
        sql = "INSERT INTO contacto (Nombre_Contacto, Apellido_Contacto, Email, Telefono,Fecha_nacimiento) VALUES (%s, %s, %s, %s,%s)"
        data = (Nombre_Contacto, Apellido_Contacto, Email, Telefono, Fecha_nacimiento)
        cursor.execute(sql,data)
        db.database.commit()
    return redirect(url_for('home'))

@app.route('/delete/<string:ID_Contacto>')
def delete(ID_Contacto):
    
    cursor  =db.database.cursor()
    sql = " DELETE FROM contacto WHERE ID_Contacto=%s "
    data = (ID_Contacto,)
    cursor.execute(sql,data)
    db.database.commit()
    return redirect(url_for('home'))

@app.route('/edit/<string:ID_Contacto>', methods = ['POST'])
def edit(ID_Contacto):
    
    Nombre_Contacto = request.form['Name']
    Apellido_Contacto = request.form['Apellido']
    Telefono = request.form['Telefono']
    Email = request.form['Email']
    Fecha_nacimiento = request.form ['Fecha']

    cursor  =db.database.cursor()
    sql = " UPDATE contacto SET Nombre_Contacto = %s, Apellido_Contacto = %s, Email = %s, Telefono = %s, Fecha_nacimiento=%s WHERE ID_Contacto=%s"
    data = (Nombre_Contacto, Apellido_Contacto, Email, Telefono,Fecha_nacimiento, ID_Contacto)
    cursor.execute(sql,data)
    db.database.commit()

    return redirect(url_for('home'))

if __name__ == '__main__':
    app.run(debug=True, port = 4000)

