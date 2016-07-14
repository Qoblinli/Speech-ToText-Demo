<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Oxford.Speech.JS.microsoft.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <meta name="msapplication-tap-highlight" content="no">
    <title></title>
    <link href="/materialize/css/font.css" rel="stylesheet" />
    <link href="/materialize/css/Icons.css" rel="stylesheet" />
    <link href="/materialize/css/prism.css" rel="stylesheet" />
    <link href="/Style/common.css" rel="stylesheet" />
    <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="/materialize/css/materialize.min.css" media="screen,projection" />
    <meta name="theme-color" content="#EE6E73">

    <meta name="viewport" content="width=device-width,initial-scale=1">

    <script src="/materialize/js/jquery-2.1.1.min.js"></script>
    <script src="/speech.1.0.0.js"></script>

    <style>
        .music {
            min-width: 50px;
            height: 20px;
            margin: 10px auto;
            position: relative;
        }

            .music i {
                width: 4px;
                height: 10px;
                position: absolute;
                bottom: 0;
                background-color: #333;
            }

                .music i:nth-of-type(1) {
                    left: 0;
                }

                .music i:nth-of-type(2) {
                    left: 8px;
                }

                .music i:nth-of-type(3) {
                    left: 16px;
                }

                .music i:nth-of-type(4) {
                    left: 24px;
                }

                .music i:nth-of-type(5) {
                    left: 32px;
                }

                .music i:nth-of-type(6) {
                    left: 40px;
                }

                .music i:nth-of-type(7) {
                    left: 48px;
                }

                .music i:nth-of-type(8) {
                    left: 56px;
                }

                .music i:nth-of-type(9) {
                    left: 64px;
                }

                .music i:nth-of-type(10) {
                    left: 72px;
                }


                .music i:nth-of-type(11) {
                    left: 80px;
                }

                .music i:nth-of-type(12) {
                    left: 88px;
                }



            .music.active i:nth-of-type(1) {
                -webkit-animation: wave 0.66s linear infinite;
                animation: wave 0.66s linear infinite;
            }

            .music.active i:nth-of-type(2) {
                -webkit-animation: wave 0.8s linear infinite;
                animation: wave 0.8s linear infinite;
            }

            .music.active i:nth-of-type(3) {
                -webkit-animation: wave 0.7s linear infinite;
                animation: wave 0.7s linear infinite;
            }

            .music.active i:nth-of-type(4) {
                -webkit-animation: wave 0.5s linear infinite;
                animation: wave 0.5s linear infinite;
            }

            .music.active i:nth-of-type(5) {
                -webkit-animation: wave 0.9s linear infinite;
                animation: wave 0.9s linear infinite;
            }

            .music.active i:nth-of-type(6) {
                -webkit-animation: wave 1.2s linear infinite;
                animation: wave 1.2s linear infinite;
            }

            .music.active i:nth-of-type(7) {
                -webkit-animation: wave 0.4s linear infinite;
                animation: wave 0.4s linear infinite;
            }

            .music.active i:nth-of-type(8) {
                -webkit-animation: wave 0.6s linear infinite;
                animation: wave 0.6s linear infinite;
            }

            .music.active i:nth-of-type(9) {
                -webkit-animation: wave 0.7s linear infinite;
                animation: wave 0.7s linear infinite;
            }

            .music.active i:nth-of-type(10) {
                -webkit-animation: wave 0.8s linear infinite;
                animation: wave 0.8s linear infinite;
            }

            .music.active i:nth-of-type(11) {
                -webkit-animation: wave 1.0s linear infinite;
                animation: wave 1.0s linear infinite;
            }

            .music.active i:nth-of-type(12) {
                -webkit-animation: wave 1.2s linear infinite;
                animation: wave 1.2s linear infinite;
            }

        @-webkit-keyframes wave {
            0% {
                height: 8px;
            }

            50% {
                height: 32px;
            }

            100% {
                height: 12px;
            }
        }

        @keyframes wave {
            0% {
                height: 8px;
            }

            50% {
                height: 32px;
            }

            100% {
                height: 12px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <nav class="teal ">
                    <div class="nav-wrapper">
                        <a class="brand-logo center" style="cursor: pointer;" onclick="window.location.href='/default.html'">Speech recognition</a>
                        <ul id="nav-mobile" class="left hide-on-med-and-down">
                            <li></li>
                            <li></li>
                            <li></li>
                        </ul>
                    </div>
                </nav>
            </div>
            <div class="row">
                <div class="col s12 m12">
                    <div class="card-panel">
                        <div class="row">
                            <h2 class="center">Microsoft Bing Speech</h2>
                            <div class="row">
                                <div class="col s6 m6">
                                    <button class="btn waves-effect waves-light" onclick="start();" id="button" type="button" name="action">
                                        Start Microphone
    <i class="material-icons right">mic</i>
                                    </button>
                                </div>

                                <div class="col s6 m6">
                                    <p class="left">
                                        <input name="group1" type="radio" value="1" checked id="test1" />
                                        <label for="test1">To English</label>
                                    </p>
                                    <p class="left">
                                        <input name="group1" type="radio" value="2" id="test2" />
                                        <label for="test2">To Chinese</label>
                                    </p>
                                </div>
                            </div>
                            <%-- <button id="en" onclick="en();">EN</button>
                            <button id="cn" onclick="cn();">CN</button>--%>
                            <div class="row">
                                <div id="div_start_animate" class="col s8 m8 right">
                                    <div class="music active">
                                        <i></i>
                                        <i></i>
                                        <i></i>
                                        <i></i>
                                        <i></i>
                                        <i></i>
                                        <i></i>
                                        <i></i>
                                        <i></i>
                                        <i></i>
                                        <i></i>
                                        <i></i>
                                        <i></i>
                                        <i></i>
                                        <i></i>
                                        <i></i>
                                        <i></i>
                                        <i></i>
                                    </div>
                                </div>
                                <div class="col s4 m4 left">
                                    <h4>Output:</h4>
                                </div>
                            </div>
                            <div class="col s12 m12" style="min-height: 200px; height: auto;" >
                                <textarea id="output" style='min-height: 200px;min-width:400px; height: auto;'></textarea>
                               


                            </div>

                        </div>


                    </div>

                </div>
            </div>
        </div>
    </form>
</body>
</html>
<script type="text/javascript">
    var client;
    var request;

    function useMic() {
        return true
    }

    function getMode() {

        //switch (document.getElementById("mode").value) {
        //    case "longDictation":
        //        return Microsoft.ProjectOxford.SpeechRecognition.SpeechRecognitionMode.longDictation;
        //default:
        return Microsoft.ProjectOxford.SpeechRecognition.SpeechRecognitionMode.shortPhrase;

    }

    function getOxfordKey() {
        return "e800cf65baa244b0a7c30324e7a62fbf";
    }

    function getLanguage() {
        var check = $("input[name='group1']:checked").val();

        if (check == "1") {
            return "en-US";
        } else {
            return "zh-CN";
        }
    }

    //function clearText() {
    //    document.getElementById("output").value = "";
    //}

    //function setText(text) {
    //    document.getElementById("output").value += text;
    //}

    //function getLuisConfig() {
    //    var appid = "e800cf65baa244b0a7c30324e7a62fbf";
    //    var subid = "e800cf65baa244b0a7c30324e7a62fbf";

    //    if (appid.length > 0 && subid.length > 0) {
    //        return { appid: appid, subid: subid };
    //    }

    //    return null;
    //}


    //function start() {
    //    var mode = getMode();
    //    var luisCfg = getLuisConfig();

    //    clearText();


    //    client = Microsoft.ProjectOxford.SpeechRecognition.SpeechRecognitionServiceFactory.createMicrophoneClientWithIntent(
    //        getLanguage(),
    //        getOxfordKey(),
    //        getOxfordKey(),
    //        luisCfg.appid,
    //        luisCfg.subid);

    //    client.startMicAndRecognition();
    //    setTimeout(function () {
    //        client.endMicAndRecognition();
    //    }, 5000);

    //    client.onPartialResponseReceived = function (response) {
    //        //alert(response);
    //        setText(response);
    //    }

    //    client.onFinalResponseReceived = function (response) {
    //        //alert(JSON.stringify(response));
    //        setText(response[0]["lexical"].toString());

    //    }

    //    client.onIntentReceived = function (response) {
    //        //alert(response);
    //        setText(response);
    //    };
    //}

    function clearText() {
        $("#output").val("");// = "";
    }

    function setText(text) {
        var _txt = $("#output").val();
        $("#output").val(_txt + text);
    }

    function getLuisConfig() {
        var appid = "e800cf65baa244b0a7c30324e7a62fbf";
        var subid = "e800cf65baa244b0a7c30324e7a62fbf";

        if (appid.length > 0 && subid.length > 0) {
            return { appid: appid, subid: subid };
        }

        return null;
    }

    $("#div_start_animate").hide();
    function stop() {
        client.endMicAndRecognition();
    }
    //document.querySelector();
    function start() {
        var mode = getMode();
        var luisCfg = getLuisConfig();
        $("#div_start_animate").show();

        clearText();

        // if (useMic()) {

        //if (luisCfg) {
        client = Microsoft.ProjectOxford.SpeechRecognition.SpeechRecognitionServiceFactory.createMicrophoneClientWithIntent(
            getLanguage(),
            getOxfordKey(),
            getOxfordKey(),
            luisCfg.appid,
            luisCfg.subid);

        //} else {
        //    client = Microsoft.ProjectOxford.SpeechRecognition.SpeechRecognitionServiceFactory.createMicrophoneClient(
        //        mode,
        //        getLanguage(),
        //        getOxfordKey(),
        //        getOxfordKey());
        //}
        client.startMicAndRecognition();
        setTimeout(function () {
            client.endMicAndRecognition();
            $("#div_start_animate").hide();

        }, 5000);
        //} else {
        //    if (luisCfg) {
        //        client = Microsoft.ProjectOxford.SpeechRecognition.SpeechRecognitionServiceFactory.createDataClientWithIntent(
        //            getLanguage(),
        //            getOxfordKey(),
        //            getOxfordKey(),
        //            luisCfg.appid,
        //            luisCfg.subid);
        //    } else {
        //        client = Microsoft.ProjectOxford.SpeechRecognition.SpeechRecognitionServiceFactory.createDataClient(
        //            mode,
        //            getLanguage(),
        //            getOxfordKey(),
        //            getOxfordKey());
        //    }
        //    request = new XMLHttpRequest();
        //    //alert(Microsoft.ProjectOxford.SpeechRecognition.SpeechRecognitionMode.shortPhrase);
        //    request.open(
        //        'GET',
        //        (mode == Microsoft.ProjectOxford.SpeechRecognition.SpeechRecognitionMode.shortPhrase) ? "whatstheweatherlike.wav" : "batman.wav",
        //        true);
        //    request.responseType = 'arraybuffer';
        //    request.onload = function () {
        //        if (request.status !== 200) {
        //            setText("unable to receive audio file");
        //        } else {
        //            client.sendAudio(request.response, request.response.length);
        //        }
        //    };

        //    request.send();
        //}

        client.onPartialResponseReceived = function (response) {
            //alert(response);
            setText(response);
        }

        client.onFinalResponseReceived = function (response) {
            //alert(JSON.stringify(response));
            setText(response[0]["lexical"].toString());

        }

        client.onIntentReceived = function (response) {
            //alert(response);
            setText(response);
        };
    }

    </script>
