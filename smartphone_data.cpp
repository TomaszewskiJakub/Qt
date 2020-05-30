#include "smartphone_data.h"
#include <QtWidgets>
#include <QtNetwork>

#include <QDebug>
#include <QHostAddress>
Smartphone_Data::Smartphone_Data(QObject *parent) : QObject(parent)
{
    udpSocket = new QUdpSocket(this);
    udpSocket->bind(port, QUdpSocket::ShareAddress);
    connect(udpSocket, SIGNAL(readyRead()),
            this, SLOT(processPendingDatagrams()));

    foreach (const QHostAddress &address, QNetworkInterface::allAddresses()) {
        if (address.protocol() == QAbstractSocket::IPv4Protocol && address != QHostAddress(QHostAddress::LocalHost)) {
            adress = address.toString();
        }
    }
}


void Smartphone_Data::processPendingDatagrams()
{
    QByteArray datagram;

    while (udpSocket->hasPendingDatagrams()) {
        datagram.resize(int(udpSocket->pendingDatagramSize()));
        udpSocket->readDatagram(datagram.data(),datagram.size() );
        //statusLabel->setText(tr("Received datagram: \"%1\"")
        //                  .arg(datagram.constData()));

        receive = true;
        emit isreceiveChanged();
        if(Conect){
            QString str=QString(datagram);
            QStringList List;
            List = str.split(',');


            Ax = List[2].toDouble();
            if(abs(Ax - lastAx) > 0.1)
                emit isAxChanged();

            lastAx = Ax;

            Ay = -List[3].toDouble();
            if(abs(Ay - lastAy) > 0.1)
                emit isAyChanged();

            lastAy = Ay;


            //Z = List[4].toDouble();
            //qDebug() << "X: " << X << "  Y  : " << Y;
            //qDebug() << str;

        }


    }

}

