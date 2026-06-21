import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts

Window {
    visible: true
    width: 1600
    height: 1000
    title: "Button Game"
    color: "#2a2a2a"

    property real score: 0
    property real multiplier1: 1.0
    property real multiplier2: 1.0
    property real multiplier3: 1.0
    property real multiplier4: 1.0
    property real rebirthMultiplier: 1.0
    property int rebirthTokens: 0
    property bool shopOpen: false

    function getRebirthCost() {
        if (rebirthTokens === 0) return 1e6
        return Math.pow(1e6, Math.pow(1.5, rebirthTokens))
    }

    function formatNumber(num) {
        if (num >= 1e12) return (num / 1e12).toFixed(2) + "T"
        if (num >= 1e9) return (num / 1e9).toFixed(2) + "B"
        if (num >= 1e6) return (num / 1e6).toFixed(2) + "M"
        if (num >= 1e3) return (num / 1e3).toFixed(2) + "K"
        return Math.floor(num).toString()
    }

    ColumnLayout {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 20
        spacing: 20

        Text {
            text: "Score: " + formatNumber(score)
            font.pixelSize: 48
            color: "#14a085"
            Layout.alignment: Qt.AlignHCenter
            font.bold: true
        }

        Text {
            text: multiplier1 > 1.0 ? multiplier1.toFixed(1) + "x" : ""
            font.pixelSize: 20
            color: "#ffd700"
            Layout.alignment: Qt.AlignHCenter
            font.bold: true
            visible: text !== ""
        }

        Text {
            text: multiplier2 > 1.0 ? multiplier2.toFixed(1) + "x" : ""
            font.pixelSize: 20
            color: "#ffd700"
            Layout.alignment: Qt.AlignHCenter
            font.bold: true
            visible: text !== ""
        }

        Text {
            text: multiplier3 > 1.0 ? multiplier3.toFixed(1) + "x" : ""
            font.pixelSize: 20
            color: "#ffd700"
            Layout.alignment: Qt.AlignHCenter
            font.bold: true
            visible: text !== ""
        }

        Text {
            text: multiplier4 > 1.0 ? multiplier4.toFixed(1) + "x" : ""
            font.pixelSize: 20
            color: "#ffd700"
            Layout.alignment: Qt.AlignHCenter
            font.bold: true
            visible: text !== ""
        }

        Text {
            text: rebirthMultiplier > 1.0 ? "Rebirths: " + rebirthTokens + " (" + rebirthMultiplier.toFixed(1) + "x)" : ""
            font.pixelSize: 18
            color: "#ff69b4"
            Layout.alignment: Qt.AlignHCenter
            font.bold: true
            visible: text !== ""
        }
    }

    RowLayout {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 20

        // Left side: Upgrade buttons at edge
        ColumnLayout {
            spacing: 20
            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter

            Button {
                text: "2x Multiplier\n(20)"
                Layout.preferredWidth: 160
                Layout.preferredHeight: 120
                font.pixelSize: 14
                enabled: score >= 20

                background: Rectangle {
                    color: !parent.enabled ? "#444444" : parent.pressed ? "#ffaa00" : parent.hovered ? "#ff9500" : "#ffa500"
                    radius: 10
                    border.color: "#cc8400"
                    border.width: 2
                }

                contentItem: Text {
                    text: parent.text
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pixelSize: parent.font.pixelSize
                    wrapMode: Text.Wrap
                }

                onClicked: {
                    if (score >= 20) {
                        score -= 20
                        multiplier1 += 1.0
                    }
                }
            }

            Button {
                text: "2x Multiplier\n(200)"
                Layout.preferredWidth: 160
                Layout.preferredHeight: 120
                font.pixelSize: 14
                enabled: score >= 200

                background: Rectangle {
                    color: !parent.enabled ? "#444444" : parent.pressed ? "#ffaa00" : parent.hovered ? "#ff9500" : "#ffa500"
                    radius: 10
                    border.color: "#cc8400"
                    border.width: 2
                }

                contentItem: Text {
                    text: parent.text
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pixelSize: parent.font.pixelSize
                    wrapMode: Text.Wrap
                }

                onClicked: {
                    if (score >= 200) {
                        score -= 200
                        multiplier2 += 1.0
                    }
                }
            }

            Button {
                text: "2x Multiplier\n(2000)"
                Layout.preferredWidth: 160
                Layout.preferredHeight: 120
                font.pixelSize: 14
                enabled: score >= 2000

                background: Rectangle {
                    color: !parent.enabled ? "#444444" : parent.pressed ? "#ffaa00" : parent.hovered ? "#ff9500" : "#ffa500"
                    radius: 10
                    border.color: "#cc8400"
                    border.width: 2
                }

                contentItem: Text {
                    text: parent.text
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pixelSize: parent.font.pixelSize
                    wrapMode: Text.Wrap
                }

                onClicked: {
                    if (score >= 2000) {
                        score -= 2000
                        multiplier3 += 1.0
                    }
                }
            }

            Button {
                text: "2x Multiplier\n(20000)"
                Layout.preferredWidth: 160
                Layout.preferredHeight: 120
                font.pixelSize: 14
                enabled: score >= 20000

                background: Rectangle {
                    color: !parent.enabled ? "#444444" : parent.pressed ? "#ffaa00" : parent.hovered ? "#ff9500" : "#ffa500"
                    radius: 10
                    border.color: "#cc8400"
                    border.width: 2
                }

                contentItem: Text {
                    text: parent.text
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pixelSize: parent.font.pixelSize
                    wrapMode: Text.Wrap
                }

                onClicked: {
                    if (score >= 20000) {
                        score -= 20000
                        multiplier4 += 1.0
                    }
                }
            }

            Button {
                text: "Reset"
                Layout.preferredWidth: 160
                Layout.preferredHeight: 80
                font.pixelSize: 16

                background: Rectangle {
                    color: parent.hovered ? "#5a5a5a" : "#3a3a3a"
                    radius: 5
                    border.color: "#666666"
                    border.width: 1
                }

                contentItem: Text {
                    text: parent.text
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pixelSize: parent.font.pixelSize
                }

                onClicked: {
                    score = 0
                    multiplier1 = 1.0
                    multiplier2 = 1.0
                    multiplier3 = 1.0
                    multiplier4 = 1.0
                }
            }

            Button {
                text: "Rebirth\n(" + formatNumber(getRebirthCost()) + ")"
                Layout.preferredWidth: 160
                Layout.preferredHeight: 120
                font.pixelSize: 14
                enabled: score >= getRebirthCost()

                background: Rectangle {
                    color: !parent.enabled ? "#444444" : parent.pressed ? "#ff1493" : parent.hovered ? "#ff69b4" : "#ff1493"
                    radius: 10
                    border.color: "#c71585"
                    border.width: 2
                }

                contentItem: Text {
                    text: parent.text
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pixelSize: parent.font.pixelSize
                    wrapMode: Text.Wrap
                }

                onClicked: {
                    if (score >= getRebirthCost()) {
                        score = 0
                        multiplier1 = 1.0
                        multiplier2 = 1.0
                        multiplier3 = 1.0
                        multiplier4 = 1.0
                        rebirthMultiplier *= 2.0
                        rebirthTokens += 1
                    }
                }
            }

            Button {
                text: "Gacha Shop\n(" + rebirthTokens + " tokens)"
                Layout.preferredWidth: 160
                Layout.preferredHeight: 120
                font.pixelSize: 14
                enabled: rebirthTokens > 0

                background: Rectangle {
                    color: !parent.enabled ? "#444444" : parent.pressed ? "#9370db" : parent.hovered ? "#ba55d3" : "#9932cc"
                    radius: 10
                    border.color: "#8b008b"
                    border.width: 2
                }

                contentItem: Text {
                    text: parent.text
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pixelSize: parent.font.pixelSize
                    wrapMode: Text.Wrap
                }

                onClicked: {
                    shopOpen = !shopOpen
                }
            }

            Item { Layout.fillHeight: true }
        }

        // Center: Main click button
        Item {
            Layout.fillWidth: true

            Button {
                text: "Click Me!"
                anchors.centerIn: parent
                width: 280
                height: 280
                font.pixelSize: 48
                font.bold: true

                background: Rectangle {
                    color: parent.pressed ? "#00d9ff" : parent.hovered ? "#0d7377" : "#14a085"
                    radius: 30
                    border.color: "#0d7377"
                    border.width: 4
                }

                contentItem: Text {
                    text: parent.text
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pixelSize: parent.font.pixelSize
                    font.bold: parent.font.bold
                }

                onClicked: {
                    score += rebirthMultiplier * multiplier1 * multiplier2 * multiplier3 * multiplier4
                }
            }
        }

        // Right side: Gacha Shop
        ColumnLayout {
            spacing: 15
            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
            visible: shopOpen
            Layout.preferredWidth: 200

            Text {
                text: "GACHA SHOP"
                font.pixelSize: 24
                color: "#9932cc"
                Layout.alignment: Qt.AlignHCenter
                font.bold: true
            }

            Text {
                text: "Tokens: " + rebirthTokens
                font.pixelSize: 16
                color: "#ff69b4"
                Layout.alignment: Qt.AlignHCenter
                font.bold: true
            }

            // Common Pack
            Button {
                text: "Common Pack\n(1 token)\n+0.1x multiplier"
                Layout.preferredWidth: 180
                Layout.preferredHeight: 100
                font.pixelSize: 12
                enabled: rebirthTokens >= 1

                background: Rectangle {
                    color: !parent.enabled ? "#444444" : parent.pressed ? "#6495ed" : parent.hovered ? "#4169e1" : "#4169e1"
                    radius: 10
                    border.color: "#00008b"
                    border.width: 2
                }

                contentItem: Text {
                    text: parent.text
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pixelSize: parent.font.pixelSize
                    wrapMode: Text.Wrap
                }

                onClicked: {
                    if (rebirthTokens >= 1) {
                        rebirthTokens -= 1
                        rebirthMultiplier += 0.1
                    }
                }
            }

            // Rare Pack
            Button {
                text: "Rare Pack\n(2 tokens)\n+0.3x multiplier"
                Layout.preferredWidth: 180
                Layout.preferredHeight: 100
                font.pixelSize: 12
                enabled: rebirthTokens >= 2

                background: Rectangle {
                    color: !parent.enabled ? "#444444" : parent.pressed ? "#daa520" : parent.hovered ? "#daa520" : "#ffa500"
                    radius: 10
                    border.color: "#ff8c00"
                    border.width: 2
                }

                contentItem: Text {
                    text: parent.text
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pixelSize: parent.font.pixelSize
                    wrapMode: Text.Wrap
                }

                onClicked: {
                    if (rebirthTokens >= 2) {
                        rebirthTokens -= 2
                        rebirthMultiplier += 0.3
                    }
                }
            }

            // Epic Pack
            Button {
                text: "Epic Pack\n(3 tokens)\n+0.8x multiplier"
                Layout.preferredWidth: 180
                Layout.preferredHeight: 100
                font.pixelSize: 12
                enabled: rebirthTokens >= 3

                background: Rectangle {
                    color: !parent.enabled ? "#444444" : parent.pressed ? "#ff1493" : parent.hovered ? "#ff69b4" : "#ff1493"
                    radius: 10
                    border.color: "#c71585"
                    border.width: 2
                }

                contentItem: Text {
                    text: parent.text
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pixelSize: parent.font.pixelSize
                    wrapMode: Text.Wrap
                }

                onClicked: {
                    if (rebirthTokens >= 3) {
                        rebirthTokens -= 3
                        rebirthMultiplier += 0.8
                    }
                }
            }

            // Legendary Pack
            Button {
                text: "Legendary Pack\n(5 tokens)\n+2.0x multiplier"
                Layout.preferredWidth: 180
                Layout.preferredHeight: 100
                font.pixelSize: 12
                enabled: rebirthTokens >= 5

                background: Rectangle {
                    color: !parent.enabled ? "#444444" : parent.pressed ? "#ffd700" : parent.hovered ? "#ffed4e" : "#ffd700"
                    radius: 10
                    border.color: "#daa520"
                    border.width: 2
                }

                contentItem: Text {
                    text: parent.text
                    color: "#333333"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pixelSize: parent.font.pixelSize
                    font.bold: true
                    wrapMode: Text.Wrap
                }

                onClicked: {
                    if (rebirthTokens >= 5) {
                        rebirthTokens -= 5
                        rebirthMultiplier += 2.0
                    }
                }
            }

            Button {
                text: "Close"
                Layout.preferredWidth: 180
                Layout.preferredHeight: 50
                font.pixelSize: 14

                background: Rectangle {
                    color: parent.hovered ? "#555555" : "#3a3a3a"
                    radius: 5
                    border.color: "#666666"
                    border.width: 1
                }

                contentItem: Text {
                    text: parent.text
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pixelSize: parent.font.pixelSize
                }

                onClicked: {
                    shopOpen = false
                }
            }

            Item { Layout.fillHeight: true }
        }
    }
}
