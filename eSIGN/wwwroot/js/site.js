// Please see documentation at https://learn.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.

function checkCookie() {
    let token = getCookie('esign_token');
    if (!token) {
        localStorage.setItem('esign_url_last', window.location.href)
        window.location.replace("/auth")
    }
    else {
        $('#userInfo').html(localStorage.getItem('fullname') + '(' + localStorage.getItem('user_id') + ')');
    }
}
function getCookie(name) {
    var value = "; " + document.cookie;
    var parts = value.split("; " + name + "=");
    if (parts.length === 2) return parts.pop().split(";").shift();
}
function deleteCookie(name) {
    document.cookie = name + "=; path=/; expires=Thu, 01 Jan 1970 00:00:00 UTC;";
}
function convertDate(strDate) {
    if (typeof (strDate) == 'object' && Object.keys(strDate).length === 0) {
        return ''
    }
    else {
        return strDate.substring(0, 10) + ' ' + strDate.substring(11, 19)
    }
}

function convertDate2(strDate) {
    if (typeof (strDate) == 'object' && Object.keys(strDate).length === 0) {
        return ''
    }
    else {
        return strDate.substring(0, 10)
    }
}

function getSignFlow(idApp) {
    $.ajax({
        url: '/Application/GetSignFlowByIdApplication',
        type: 'GET',
        headers: {
            'Authorization': 'Bearer ' + getCookie('esign_token')
        },
        data: { idApp: idApp },
        success: function (res) {
            let data = res.data
            let htmlTBodyModal = ''
            for (let i = 0; i < data.length; i++) {
                let classBadge = '';
                switch (data[i].id_value_sign) {
                    case 1:
                        classBadge = 'badge-warning';
                        break;
                    case 2:
                        classBadge = 'badge-primary';
                        break;
                    case 3:
                    case 9:
                        classBadge = 'badge-success';
                        break;
                    case 4:
                        classBadge = 'badge-danger';
                        break;
                    case 5:
                        classBadge = 'badge-info';
                        break;
                    case 6:
                    case 7:
                        classBadge = 'badge-secondary';
                        break;
                    case 8:
                        classBadge = 'badge-dark';
                        break;
                    default:
                        break;
                }

                let htmlFile = '';
                if (data[i].file) { 
                    let urlList = data[i].file_name.split('.')
                    let extensionFile = urlList[urlList.length - 1]

                    let base64 = 'data:text/plain;base64,' + data[i].file;

                    let baseUrl = `${window.location.protocol}//${window.location.hostname}:${window.location.port}`;
                    
                    if (extensionFile === 'docx') {
                        htmlFile = `<a href="${base64}" download="${data[i].file_name}"><img src="${baseUrl}/lib/dist/img/docx.png" alt="Docx" class="file-image" /> ${data[i].file_name}</a>`
                    }
                    if (extensionFile === 'pdf') {
                        htmlFile = `<a href="${base64}" download="${data[i].file_name}"><img src="${baseUrl}/lib/dist/img/pdf.jpg" alt="PDF" class="file-image" /> ${data[i].file_name}</a>`
                    }
                    if (extensionFile === 'xlsx' || extensionFile === 'xls') {
                        htmlFile = `<a href="${base64}" download="${data[i].file_name}"><img src="${baseUrl}/lib/dist/img/excel.png" alt="Excel" class="file-image" /> ${data[i].file_name}</a>`
                    }
                    if (extensionFile === 'pptx') {
                        htmlFile = `<a href="${base64}" download="${data[i].file_name}"><img src="${baseUrl}/lib/dist/img/powerpoint.png" alt="Powerpoint" class="file-image" /> ${data[i].file_name}</a>`
                    }
                }
                htmlTBodyModal += `<tr>
                                        <th>${data[i].display_name}</th>
                                        <th>${data[i].sequence}</th>
                                        <th>${convertDate(data[i].sign_at)}</th>
                                        <th>${data[i].comment}</th>
                                        <th>${convertDate2(data[i].start_date)}</th>
                                        <th>${convertDate2(data[i].end_date)}</th>
                                        <th><span class="badge ${classBadge}">${data[i].value_sign}</span></th>
                                        <th>${htmlFile}</th>
                                    </tr>`

            }
            $('#tbody-modal-' + idApp).html(htmlTBodyModal)

        },
        error: function (err) {
            if (err.status == 401) {
                logout();
            }
            else {
                alert('An error occurred. ' + err.responseText);
            }
        }
    });
}
function truncateString(str) {
    let maxLength = 100;
    if (str.length > maxLength) {
        return str.substring(0, maxLength) + '...';
    }
    return str;
}