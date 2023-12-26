class SocialModel{

  String? address;
  String? icon_path;
  SocialType? socialType;

  SocialModel(  {this.address, this.socialType,this.icon_path});
}


enum SocialType{
  linkedin,
  github,
  telegram,
  dribble,
  other
}