########################################################################################################################################
#
#                                        IMPORTATION DES LIBRAIRIES
#
#######################################################################################################################################
import os
from dotenv import load_dotenv
from urllib.parse import quote_plus
from flask import Flask, redirect,abort, render_template, request, url_for,jsonify
from flask_sqlalchemy import SQLAlchemy
########################################################################################################################################
#
#                                        VARIABLES ENVIRONEMENT
#
#######################################################################################################################################
load_dotenv()
password=os.getenv('password')
host=os.getenv('host')
########################################################################################################################################
#
#                                        CONNEXION BASE DE DONNE
#
#######################################################################################################################################
app=Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI']='postgresql://postgres:{}@{}:5432/bookdb'.format(password,host)
app.config['SQLALCHEMY_TRACK_MODIFICATIONS']=True
db=SQLAlchemy(app)
########################################################################################################################################
#
#                                         CLASS CATEGORIE + METHODES CRUD
#
#######################################################################################################################################
class Categorie(db.Model):
    __tablename__="categories"
    id=db.Column(db.Integer,primary_key=True)
    libelle=db.Column(db.String, nullable=False,unique=True)
    db.relationship("Livre",backref="Categorie",lazy=True)

    def __init__(self,libelle):
        self.libelle=libelle

    def insert(self):
        db.session.add(self)
        db.session.commit()

    def update(self):
        db.session.commit()

    def delete(self):
        db.session.delete(self)
        db.session.commit()

    def format(self):
        return{
            "Id":self.id,
            "Nom Categorie":self.libelle }
########################################################################################################################################
#
#                                        CLASS LIVRE + METHODES CRUD
#
#######################################################################################################################################
class Livre(db.Model):
    __tablename__="livres"
    id=db.Column(db.Integer,primary_key=True )
    isbn=db.Column(db.String,nullable=False,unique=True)
    titre=db.Column(db.String, nullable=False)
    datepub=db.Column(db.Date,nullable=False)
    auteur=db.Column(db.String,nullable=False)
    editeur=db.Column(db.String,nullable=False)
    idcat=db.Column(db.Integer, db.ForeignKey("categories.id"))

    def __init__(self,isbn,titr,datepub,auteur,editeur,idcat):
        self.isbn=isbn
        self.titre=titre
        self.datepub=datepub
        self.auteur=auteur
        self.editeur=editeur
        self.idcat=idcat

    def insert(self):
        db.session.add(self)
        db.session.commit()

    def update(self):
        db.session.commit()

    def delete(self):
        db.session.delete(self)
        db.session.commit()

    def format(self):
        return{
            "Identifiant":self.id,
            "Isbn":self.isbn,
            "Titre":self.titre,
            "Auteur":self.auteur, 
            "Editeur":self.editeur, 
            "Code Categorie":self.idcat, 
            "Date de Publication":self.datepub.strftime("%b %d, %Y") }
db.create_all()
########################################################################################################################################
#
#                                        AFFICHER TOUT LES LIVRES
#
#######################################################################################################################################
@app.route("/books",methods=["GET"])
def allLivre():
    livres=Livre.query.all()
    formLivre=[livre.format() for livre in livres]
    return jsonify({
        "Success":True,
        "Book":formLivre,
        "Total Book":Livre.query.count()
    })
########################################################################################################################################
#
#                                        AFFICHER TOUTES LES CATEGORIE
#
#######################################################################################################################################
@app.route("/categories",methods=["GET"])
def allCategorie():
    categories=Categorie.query.all()
    formCatego=[cate.format() for cate in categories]
    return jsonify({
        "Success":True,
        "Categories":formCatego,
        "Total Categories":Categorie.query.count()
    })
########################################################################################################################################
#
#                                        AFFICHER UN LIVRE AVEC SON ID
#
#######################################################################################################################################
@app.route("/books/<int:id>",methods=["GET"])
def getOneLivre(id):
    livre=Livre.query.get(id)
    if livre is None:
        abort(404)
    else:
        return jsonify({
        "Succes":True,
        "Selected Book ID":id,
        "Livre":livre.format()
    })
########################################################################################################################################
#
#                                        AFFICHER UNE CATEGORIE AVEC SON ID
#
#######################################################################################################################################
@app.route("/categories/<int:id>",methods=["GET"])
def getOneCategorie(id):
    categ=Categorie.query.get(id)
    if categ is None:
        abort(404)
    else:
        return jsonify({
        "Succes":True,
        "Selected Categorie ID":id,
        "Categorie":categ.format()
    })
########################################################################################################################################
#
#                                        SUPPRIMER UN LIVRE
#
#######################################################################################################################################
@app.route("/books/<int:id>",methods=["DELETE"])
def deleteLivre(id):
    livre=Livre.query.get(id)
    if livre is None:
        abort(404)
    else:
        livre.delete()
        return jsonify({
        "Succes":True,
        "deletedID":id,
        "Total Book":Livre.query.count(),
        "Deleted Book":livre.format()
    })
########################################################################################################################################
#
#                                        SUPPRIMER UNE CATEGORIE
#
#######################################################################################################################################
@app.route("/categories/<int:id>",methods=["DELETE"])
def deleteCategorie(id):
    categ=Categorie.query.get(id)
    if categ is None:
        abort(404)
    else:
        categ.delete()
        return jsonify({
        "Succes":True,
        "deletedID":id,
        "Total Categories":Categorie.query.count(),
        "Deleted Categorie":categ.format()
    })
########################################################################################################################################
#
#                                        MODIFIER LIVRE AVEC SON ID
#
#######################################################################################################################################
@app.route("/books/<int:id>",methods=["PATCH"])
def updateLivre(id):
    try:
        body=request.get_json() 
        livre=Livre.query.get(id) 
        livre.isbn=body.get("Isbn",None) 
        livre.titre=body.get("Titre",None)
        livre.auteur=body.get("Auteur",None)
        livre.editeur=body.get("Editeur",None)
        livre.datepub=body.get("Date de Publication",None)
        livre.idcat=body.get("Code Categorie",None)
        if livre is None:
            abort(404)
        if livre.isbn is None:
            abort(400)
        if livre.titre is None:
            abort(400)
        if livre.auteur is None:
            abort(400)
        if livre.editeur is None:
            abort(400)
        if livre.datepub is None:
            abort(400)
        if livre.idcat is None:
            abort(400)
    except (AttributeError,NameError):
        abort(500)
    else:
            livre.update()
            return jsonify({
            "Succes":True,
            "Updated Book ID":id,
            "Updated Book":livre.format()
        })
########################################################################################################################################
#
#                                        MODIFIER CATEGORIE AVEC SON ID
#
#######################################################################################################################################
@app.route("/categories/<int:id>",methods=["PATCH"])
def updateCategorie(id):
    try:
        body=request.get_json()
        categ=Categorie.query.get(id) 
        categ.libelle=body.get("Nom Categorie",None) 
        if categ is None:
            abort(404)
        if categ.libelle is None:
            abort(400)
    except (AttributeError,NameError):
        abort(500)
    else:
        categ.update()
        return jsonify({
        "Succes":True,
        "Updated Categorie ID":id,
        "Updated Categorie":categ.format()
    })
########################################################################################################################################
#
#                                        AFFICHER LES LIVRES D'UNE CATEGORIE
#
#######################################################################################################################################
@app.route("/categories/<int:id>/books",methods=["GET"])
def getLivreInCategorie(id):
    livres=Livre.query.filter_by(idcat=id)
    formLivre=[livre.format() for livre in livres]
    return jsonify({
        "Categorie":str(Categorie.query.get(id).libelle),
        "Success":True,
        "Book":formLivre,
        "Total Book":len(formLivre)
    })
########################################################################################################################################
#
#                                        ERRORS HANDLER
#
#######################################################################################################################################
@app.errorhandler(404)
def notFound(error):
    return jsonify({
        "Success":False,
        "Message":"Not Found",
        "Error":404
    }),404

@app.errorhandler(500)
def serverError(error):
    return jsonify({
        "Success":False,
        "Message":"Internal Server Error",
        "Error":500
    }),500

@app.errorhandler(400)
def badRequest(error):
    return jsonify({
        "Success":False,
        "Message":"Bad Request",
        "Error":400
    }),400
    
@app.errorhandler(405)
def badRequest(error):
    return jsonify({
        "Success":False,
        "Message":"Method Not Allowed",
        "Error":405
    }),405