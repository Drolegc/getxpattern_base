enum RoleType{
    authenticated,
    public,
    admin
}

class Role {

    String description;
    int id;
    String name;
    String type;

    RoleType get role {
        switch(this.type){
            case'authenticated':
                return RoleType.authenticated;
            case 'public':
                return RoleType.public;
            case 'admin':
                return RoleType.admin;
            default:return RoleType.authenticated;
        }
    }

    Role({required this.description,required  this.id,required  this.name,required this.type});

    factory Role.fromJson(Map<String, dynamic> json) {
        return Role(
            description: json['description'], 
            id: json['id'],
            name: json['name'], 
            type: json['type'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['description'] = this.description;
        data['id'] = this.id;
        data['name'] = this.name;
        data['type'] = this.type;
        return data;
    }

}