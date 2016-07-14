<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Oxford.Speech.JS.watson.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="msapplication-tap-highlight" content="no">
    <title></title>
    <link href="/materialize/css/font.css" rel="stylesheet" />
    <link href="/materialize/css/Icons.css" rel="stylesheet" />
    <link href="/materialize/css/prism.css" rel="stylesheet" />
    <%--<link href="/Style/common.css" rel="stylesheet" />--%>
    <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="/materialize/css/materialize.min.css" media="screen,projection" />
    <meta name="theme-color" content="#EE6E73">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <script src="fetch.js"></script>
    <script src="watson-speech.min.js"></script>
    <script src="base64.js"></script>
    <script src="../materialize/js/jquery-2.1.1.min.js"></script>
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
            <div class="row">
                <div class="col s12 m12">
                    <div class="card-panel">
                        <div class="row">
                            <h2 class="center">IBM Watson Speech-To-Text</h2>
                            <div class="row">
                                <div class="col s6 m6">
                                    <button class="btn waves-effect waves-light" id="button" type="submit" name="action">
                                        Start Microphone
    <i class="material-icons right">mic</i>
                                    </button>
                                    <button class="btn waves-effect waves-light" id="stop" type="submit" name="action">
                                        Stop Microphone
    <i class="material-icons right">stop</i>
                                    </button>
                                </div>

                                <div class="col s6 m6">
                                    <p class="left">
                                        <input name="group1" onclick="en();" type="radio" checked id="test1" />
                                        <label for="test1">To English</label>
                                    </p>
                                    <p class="left">
                                        <input name="group1" onclick="cn();" type="radio" id="test2" />
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
                            <div id="output" class="col s12 m12" style="min-height: 200px; height: auto; border: 1px solid black;">
                                ----


                            </div>

                        </div>


                    </div>

                </div>
            </div>

        </div>
    </div>



</body>
</html>

<script>
    $("#div_start_animate").hide();
    _model = "en-US_BroadbandModel";
    var en = function () {
        _model = "en-US_BroadbandModel";
        $("#output").html(" ");
    };
    var cn = function () {
        _model = "zh-CN_BroadbandModel";
        $("#output").html(" ");
        
    };

    document.querySelector('#button').onclick = function () {
        $("#div_start_animate").show();
        fetch("/test.aspx").then(function (response) {
            return response.text();
        }).then(function (token) {
            //var token = "rbOaKzc6Z6YuOLXKmDWY1O1hhKb3n9Fm30Ug8FcQL0ZjWeUNtGRIMoJBwiY3gtFvlJaRVTXb2BIKBfAmrSBz0GNTlvqW6hl3RYelc1RFPoHx0IR0L7A1x7S1pEF8MNq%2Fm79pWOA1MszO38D9uh0VGMVSac3ImWMSd0C%2F8hCXeQBC28JfwrcuSMNDsuFqlrcAcvT331nAPRgK7SeazkQ4x67MBVbYWr4y0VQgqCUeX9gWcLcJWodzQeN2BPgD%2Fhi24tlia92sZk%2FOjZ4vxY7RNQXPIVMwU9djHm5tmXVHHWa%2B6Suzv1uUHm2pe5K18dEBRUB5M0CS4Gc7U1HCxeY4YRYVppKlLX2LwkXLzM14Jm%2BDjX%2FqSWxc3smfsaTGMgSaMAuuaag45gzbAHbQdHOwelBVsqtchNeUDM8Lg3ldAZKao2hnA3RjgbfVr9BpCK%2F0A3fRIt9Zi9YBBfHfVz8UZOHyYEkOJLz4jTiX2hObnkBI7JDFqxclonNiRWOQimALQRAQDq747IwaAllMXKOXhvFqTJUFhK%2FNotgT4N3Pb5nganzrE%2FWpKVu2Ibz3g2nmLt3fzody1nKR20qeQnaI04HcJZerEZjkhVBXe%2FZY15NHtXkiwSN3J64yWdTVrETwVG4VdQebONcMudKMUCqyMUfnvg6fucZj0lAdzw4GY2c5gD6Bfngh7tLgNNtzxRECc45Uj4Dh96QmZ496Dx6FYZmjthWScURLOhWX79FLJIAZPeqkDJi8v1sW4jylINgM1PiE7GQOP%2FVsXyGOv9SEZcMemoy9iv2hdSxSTukDRK6fjG1Nj0WiOSsZbkTkf8GsSbUeqsVE6VJtTCzFQBN33eHk8nCYlBey";
            //alert(_model);
            var stream = WatsonSpeech.SpeechToText.recognizeMicrophone({
                token: token,
                outputElement: '#output', // CSS selector or DOM Element 
                model: _model
            });

            stream.on('error', function (err) {
                console.log(err);
            });

            document.querySelector('#stop').onclick = function () {
              
                stream.stop();              
                $("#div_start_animate").hide();
                
               
            };
            

        }).then(function (error) {
            console.log(error);
        });
    };


</script>
<!-- var auth = "dd68bc8d-082c-4c94-8ea1-06285bb5d80e:hBrkADh05V5V";
    var auth64 = BASE64.encoder(auth);
    var credentials = "Basic " + auth64;

    fetch("https://stream.watsonplatform.net/speech-to-text/api/v1", {
        method: "get",
        headers: new Headers({
            'Content-Type': 'text/plain',
            'Authorization': credentials
        })

    })
        .then(function (response) {
            //alert(response.text());
            return response.text();
        }).then(function (token) {
            // alert(token);

            var stream = WatsonSpeech.SpeechToText.recognizeMicrophone({
                token: token,
                outputElement: '#output' // CSS selector or DOM Element
            });

            stream.on('error', function (err) {
                console.log(err);
            });

            document.querySelector('#stop').onclick = function () {
                stream.stop();
            };

        }).catch(function (error) {
            console.log(error);

            alert(error);
        });
     };-->
