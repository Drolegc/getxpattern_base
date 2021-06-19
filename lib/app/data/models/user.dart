import 'package:encuestop/app/data/models/perfil_c.dart';
import 'package:encuestop/app/data/models/perfil_p.dart';
import 'package:encuestop/app/data/models/role.dart';

class User {
    String email;
    int id;
    PerfilC? perfil_c;
    PerfilP? perfil_p;
    Role role;
    String updated_at;
    String username;

    User({required this.email,required this.id, this.perfil_c, this.perfil_p,required this.role,required this.updated_at,required this.username});

    factory User.fromJson(Map<String, dynamic> json) {
        return User(
            email: json['email'],
            id: json['id'], 
            perfil_c: json['perfil_c'] != null ? PerfilC.fromJson(json['perfil_c']) : null, 
            perfil_p: json['perfil_p'] != null ? PerfilP.fromJson(json['perfil_p']) : null, 
            role: Role.fromJson(json['role']),
            updated_at: json['updated_at'], 
            username: json['username'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['email'] = this.email;
        data['id'] = this.id;
        data['updated_at'] = this.updated_at;
        data['username'] = this.username;
        /*if (this.perfil_c != null) {
            data['perfil_c'] = this.perfil_c.toJson();
        }
        if (this.perfil_p != null) {
            data['perfil_p'] = this.perfil_p.toJson();
        }*/
        if (this.role != null) {
            data['role'] = this.role.toJson();
        }
        return data;
    }
}