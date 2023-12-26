class SocialModel{

  String? address;
  SocialType? socialType;

  SocialModel(  {this.address, this.socialType});
}


enum SocialType{
  linkedin,
  github,
  telegram,
  dribble,
  other
}