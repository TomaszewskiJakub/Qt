#ifndef SMARTPHONE_DATA_H
#define SMARTPHONE_DATA_H

#include <QMainWindow>
#include <QObject>
#include <QQuickItem>
#include <QWidget>
#include <QtNetwork>
QT_BEGIN_NAMESPACE
class QLabel;
class QUdpSocket;
QT_END_NAMESPACE
/**
 * @brief Klasa odpowiedzialna za logikę aplikacji
 *
 * Klasa odpowiedzialna za komunikację aplikacji ze smartfonem oraz odbiór wysyłanych danych i przypisanie ich do odpowiednich zmiennych.
 */
class Smartphone_Data : public QObject
{
    Q_OBJECT
public:
    /**
     * @brief Konstruktor klasy.
     *
     * Odpowiada on za odczytanie adresu IPv4 komputera oraz ustawienie zmiennej udpSocket tak, aby była
     * gotowa na odbieranie danych z adresu IPv4 komputera przekazywanych przez zadany port
     *
     * @see Zmienna udpSocket oraz port
     */
    explicit Smartphone_Data(QObject *parent = nullptr);
    Q_PROPERTY(double Ax READ get_Ax() NOTIFY isAxChanged)
    Q_PROPERTY(double Ay READ get_Ay() NOTIFY isAyChanged)
    Q_PROPERTY(bool Conect READ getConect() WRITE setConect NOTIFY isConectChanged)
    Q_PROPERTY(bool receive READ getreceive() NOTIFY isreceiveChanged)
    Q_PROPERTY(QString adress READ getAdress() CONSTANT)
    Q_PROPERTY(int port READ getport() CONSTANT)
public slots:
    /**
     * @brief Jest to funkcja odbierające kolejne ramki danych.
     *
     * Przypisujące odpowiednim zmiennym odebrane dane z akcelerometru
     */
    void processPendingDatagrams();

    /**
     * @brief Funkcja zwracająca aktualną wartość zmiennej Ax
     * @return Aktualna wartość przyspieszenia względem osi OX
     * @see zmienna Ax
     */
    double get_Ax() const
    {
        return Ax;
    }
    /**
     * @brief Funkcja zwracająca aktualną wartość zmiennej Ay
     * @return Aktualna wartość przyspieszenia względem osi OY
     * @see zmienna Ay
     */
    double get_Ay() const
    {
        return Ay;

    }

    /**
     * @brief Funkcja zwracająca aktualną wartość zmiennej Conect
     * @return Aktualna wartość zmiennej Conect
     * @see zmienna Conect
     */
    bool getConect() const
    {
        return Conect;
    }
    /**
     * @brief Przypisuję pzekazaną wartość do zmiennej Conect
     *
     * @param wartosc : nowa wartość bool zmiennej Conect
     * @see zmienna Conect
     */
    void setConect(bool wartosc)
    {
        Conect = wartosc;
        emit isConectChanged();
    }
    /**
     * @brief Funkcja zwracająca aktualną wartość zmiennej receive
     * @return Aktualna wartość zmiennej receive
     * @see zmienna receive
     */
    bool getreceive() const
    {
        return receive;
    }
    /**
     * @brief Funkja zwracająca adres IPv4 komputera
     * @return Adres IPv4 komputera
     * @see zmienna adress
     */
    QString getAdress() const
    {
        return  adress;
    }
    /**
     * @brief Funckja zwracająca zmienną port
     * @return 4 cyfrowa liczba określająca port komunikacyjny
     * @see zmienna port
     */
    int getport() const
    {
        return  port;
    }


private:
   // QLabel *statusLabel = nullptr;
    /**
     * @brief Zmienna odpowiedzialna za komunikację aplikacji ze smartfonem oraz odbiór przesyłanych danych
     */
    QUdpSocket *udpSocket = nullptr;
    /**
     * @brief Zmienna określająca wartość  przyspieszenia względem osi OX odebranego z akcelerometru
     *
     * Wartość zmiennej mieści się w zakresie od \f$ -9.81 \f$ do \f$ 9.81 \frac{m}{s^2} \f$
     */
    double Ax = 0;
    /**
     * @brief Zmienna określająca poprzednią wartość odebranego przyspieszenia względem osi OX.
     *
     *  Zmienna wykorzystywana jest do sprawdzenia czy wartość nowo przesłanej danej jest na tyle duża aby ją zaktualizować.
     *  Wartość zmiennej mieści się w zakresie od \f$ -9.81 \f$ do \f$ 9.81 \frac{m}{s^2} \f$
     */
    double lastAx = 0;
    /**
     * @brief Zmienna określająca wartość przyspieszenia względem osi OY odebranego z akcelerometru
     *
     *  Wartość zmiennej mieści się w zakresie od \f$ -9.81 \f$ do \f$ 9.81 \frac{m}{s^2} \f$
     */
    double Ay = 0;
    /**
     * @brief Zmienna określająca poprzednią wartość odebranego przyspieszenia względem osi OY.
     *
     * Zmienna wykorzystywana jest do sprawdzenia czy wartość nowo przesłanej danej jest na tyle duża aby ją zaktualizować.
     * Wartość zmiennej mieści się w zakresie od \f$ -9.81 \f$ do \f$ 9.81 \frac{m}{s^2} \f$
     */
    double lastAy = 0;
    /**
     * @brief Zmienna określająca czy odebrane dane mają wpływać na sterowanie samochode
     */
    bool Conect=false;
    /**
     * @brief Zmienna określająca status nawiązania połączenia (domyślnie false)
     */
    bool receive=false;
    /**
     * @brief Adres IPv4 komputera
     */
    QString adress;
    /**
     * @brief PORT komunikacyjny którym zostaną wysłane dane (domyślnie 5555
     */
    int port = 5555;


signals:
    /**
     * @brief Sygnał emitowany w momencie zmiany wartośći zmiennej Ax
     *
     * Sygnał ten jest niezbędny ponieważ, aby parametry w plikach qml które zależą od wartości Ax zmieniały się przy każdej jej zmianie, potrzebny jest sygnał informujący o jej zmianie
     * @see zmienna Ax
     */
    void isAxChanged();
    /**
     * @brief Sygnał emitowany w momencie zmiany wartośći zmiennej Ay
     *
     * Sygnał ten jest niezbędny ponieważ, aby parametry w plikach qml które zależą od wartości Ay zmieniały się przy każdej jej zmianie, potrzebny jest sygnał informujący o jej zmianie
     * @see zmienna Ay
     */
    void isAyChanged();
    /**
     * @brief Sygnał emitowany w momencie zmiany wartośći zmiennej Conect
     *
     * Sygnał ten jest niezbędny ponieważ, aby parametry w plikach qml które zależą od wartości Conect zmieniały się przy każdej jej zmianie, potrzebny jest sygnał informujący o jej zmianie
     * @see zmienna Conect
     */
    void isConectChanged();
    /**
     * @brief Sygnał emitowany w momencie zmiany wartośći zmiennej receive
     *
     * Sygnał ten jest niezbędny ponieważ, aby parametry w plikach qml które zależą od wartości receive zmieniały się przy każdej jej zmianie, potrzebny jest sygnał informujący o jej zmianie
     * @see zmienna receive
     */
    void isreceiveChanged();

};

#endif // SMARTPHONE_DATA_H
