# [Flutter] Flutter strted with bloc

Example application flutter template with bloc

## Getting Started

This project is a starting point for a Flutter application.

### Featured : 
- Already implements Theme Dark and White
- Unit Testing
- Logic auth logIn/logOut
- Clean Arsitektur

#

##### Changes Theme 
    context.read<ThemeCubit>().changeTheme();

##### Login Function
Needed adding more logic for insert user and password
    context.read<AuthenticationRepository>().login();

##### Logout Function
    context.read<AppBloc>().add(AppLogoutRequested());
