#ifndef MAINPAGE_H
#define MAINPAGE_H
/** @file mainpage.h
* @brief Opis głównej strony Doxygena
*
*/
/** @mainpage Sterowanie ruchem symulowanego pojazdu
*
* @authors Jakub Tomaszewski
* @date 03.05.2020r.
* @section intro Wprowadzenie
* Aplikacja ma umożliwić użytkownikowi sterowanie pojazdem 3D przy pomocy akcelerometru umieszczonego w smartfonie.
* Akcelerometr to urzadzenie mierzące przyspieszenia kąowe względem wybranych osi. Zatem przechylenie smartfona wokół poszczególnych osi
* przekłada się na zmianę prędkości lub skrętu poruszającego się pojazdu w aplikacji. Pobór danych z akcelerometru oraz ich wysłanie
* do aplikacji umożliwia apliakcja <A HREF="https://play.google.com/store/apps/details?id=de.lorenz_fenster.sensorstreamgps&hl=pl"> SensorStream </A>
* Stworzona aplikacja oprócz samego sterowania udostępnia użytkownikowi szereg informacji na temat poruszającego się pojazdu.
* Są to historie przesyłanych danych, prędkości jak i rotacji pojazdu zrealizowane w postaci wykresów, jak i bieżące informacje na temat akrualnych danych.
* Aplikacja umożliwa również na włączenie lub wyłączenie wpływu sterowania czy zmiane skali okna.
* Ze względu na specyfikę problemu jakim było efektywne wyświetlenie oraz sterowanie elementami 3D stworzonymi przy pomocy programu Autodesk Inventor
* zdecydowano się na stworzenie interfejsu graficznego aplikacji wykorzystująć język QML natomiast część logiczną odpowiedzialną za komunikację
* aplikacji ze smartfonem wykonano przy pomocy C++:
*
*  Część logiczna aplikacji odpowiedzialna za odbieranie oraz przypisywanie danych do odpowiednich zmiennych zrelizowana w C++:
* -# smartphone_data.h
* -# smartphone_data.cpp
*
* Interfejs graficzny plikacji zreazlizowany przy pomocy języka QML:
* -# ArrowScene.qml
* -# BasicCamera.qml
* -# CarBackground.qml
* -# CarScene.qml
* -# ChartAccelerometer.qml
* -# ChartRho.qml
* -# ChartSpeed.qml
* -# NetworkInfo.qml
* -# Object.qml
* -# ObjectEffect.qml
* -# ObjectMaterial.qml
* -# ObjectWithMaterial.qml
* -# SettingsWindow.qml
*
*
*
* Część logiczna napisana w C++ oraz interfejs graficzny stworzony przy pomocy języka QML współpracują ze sobą poprzez wymienę oraz uzależnienie odpowiednich zmiennych.
*
*
*/
#endif // MAINPAGE_H
