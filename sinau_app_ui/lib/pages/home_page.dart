import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/main_bg.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              logoContainer(),
              signInContainer(context),
            ],
          ),
        ),
      ),
    );
  }

  Container signInContainer(context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 43),
      height: 426,
      decoration: BoxDecoration(
        color: Color(0xffF1F1FA),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50,
              width: double.infinity,
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: Color(0xff6360FF),
                  ),
                  hintText: "Email",
                  hintStyle: TextStyle(color: Color(0xff91919F)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 18),
            TextField(
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                prefixIcon: Icon(
                  Icons.lock_outline,
                  color: Color(0xff6360FF),
                ),
                hintText: "Password",
                hintStyle: TextStyle(color: Color(0xff91919F)),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
              ),
            ),
            SizedBox(height: 18),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  backgroundColor: Color(0xff6360FF),
                ),
                child: Text(
                  "Sign In",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 18),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  backgroundColor: Color(0xffFF8181),
                ),
                child: Text(
                  "Sign In with Google",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 36),
              child: Text(
                "Feel free tro use this UI Kit \n © Harum Shidiqi",
                style: TextStyle(
                  color: Color(0xff91919F),
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }

  logoContainer() {
    return Expanded(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo.png"),
            Padding(
              padding: const EdgeInsets.only(top: 32.0, bottom: 17),
              child: Image.asset("assets/images/name.png"),
            ),
            Text(
              "Learn from anything and anywhere",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
