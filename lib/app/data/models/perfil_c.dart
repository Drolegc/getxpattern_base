class PerfilC {
    int id;
    String secondary_email;

    PerfilC({required this.id,required this.secondary_email});

    factory PerfilC.fromJson(Map<String, dynamic> json) {
        return PerfilC(
            id: json['id'], 
            secondary_email: json['secondary_email'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['secondary_email'] = this.secondary_email;
        return data;
    }
}