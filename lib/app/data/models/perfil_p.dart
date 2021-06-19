class PerfilP {

    int id;

    String identidad_de_genero;
    String fecha_de_naciemiento;

    String? educacion;
    String? estado_civil;
    String? telefono;

    PerfilP({ this.educacion, this.estado_civil,required this.fecha_de_naciemiento,required this.id,required this.identidad_de_genero, this.telefono});

    factory PerfilP.fromJson(Map<String, dynamic> json) {
        return PerfilP(
            educacion: json['educacion'], 
            estado_civil: json['estado_civil'], 
            fecha_de_naciemiento: json['fecha_de_naciemiento'], 
            id: json['id'], 
            identidad_de_genero: json['identidad_de_genero'], 
            telefono: json['telefono'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['educacion'] = this.educacion;
        data['estado_civil'] = this.estado_civil;
        data['fecha_de_naciemiento'] = this.fecha_de_naciemiento;
        data['id'] = this.id;
        data['identidad_de_genero'] = this.identidad_de_genero;
        data['telefono'] = this.telefono;
        return data;
    }
}