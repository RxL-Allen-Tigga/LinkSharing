<form action="/sendInvitation/SendTopicInvitation" method="POST">
    <div class="modal fade" id="Send_Invitation" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Send Invitation</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>

                <div class="modal-body">
                    <div class="modal-form-group">
                        <label for="email">Email<span style="color: red;">*</span></label>
                        <input type="email" name="email" class="form-control" id="email" placeholder="Enter Email" required maxlength="250">
                    </div>

                    <div class="mb-3">
                        <label for="topicSelect">Topic<span style="color: red;">*</span></label>
                        <select name="topicId" class="form-select" id="SelectTopic" required>
                            <g:each in="${subscribedTopics}" var="topic">
                                <option value="${topic.id}">${topic.name} (${topic.visibility})</option>
                            </g:each>
                        </select>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Invite</button>
                </div>
            </div>
        </div>
    </div>
</form>

<script>
    function loadShareLinkModal() {
        $.ajax({
            url: "${createLink(controller: 'topicOperations', action: 'loadShareLinkModal')}",
            type: "GET",
            success: function (data) {
                $("#modalBodyContent").html(data);
                $("#Share_Link_temp").modal('show');
            },
            error: function () {
                alert("Failed to load modal content");
            }
        });
    }

    // Example: open modal on button click
    $(document).on("click", "#openShareModal", function () {
        loadShareLinkModal();
    });
</script>
<!-- Modal -->
<form action="/topicOperations/shareLink" method="POST">
    <div class="modal fade" id="Share_Link" tabindex="-1" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel_temp">Share Link</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>

                <div class="modal-body">
                    <div class="modal-form-group ">
                        <label for="exampleFirstName">Link<span style="color: red;">*</span></label>
                        <input name="link" type="text" class="form-control" id="Link1_temp" placeholder="Link" required maxlength="250">
                    </div>

                    <div class="modal-form-group ">
                        <label for="exampleFirstName">Description<span style="color: red;">*</span></label>
                        <textarea name="description" class="form-control" id="exampleFormControlTextarea1_temp"
                                  rows="10" required></textarea>
                    </div>

                    <div class="mb-3">
                        <label for="topicSelect">Topic<span style="color: red;">*</span></label>
                        <select name="topicId" class="form-select" id="topicSelect" required>
                            <g:each in="${subscribedTopics}" var="topic">
                                <option value="${topic.id}">${topic.name} (${topic.visibility})</option>
                            </g:each>
                        </select>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Share</button>
                </div>
            </div>
        </div>
    </div>
</form>

<!-- Modal -->
<form action="/topicOperations/shareDocument" method="POST" enctype="multipart/form-data">
    <div class="modal fade" id="Share_Document" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel2">Share Document</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>

                <div class="modal-body">
                    <div class="mb-3">
                        <label for="formFile" class="form-label">Document<span style="color: red;">*</span></label>
                        <input class="form-control" type="file" id="formFile" name="documentFile"
                               accept=".pdf,.doc,.docx" required>
                    </div>

                    <div class="modal-form-group">
                        <label for="description">Description<span style="color: red;">*</span></label>
                        <textarea class="form-control" name="description" id="description" rows="5" required></textarea>
                    </div>

                    <div class="mb-3">
                        <label for="topicSelect">Topic<span style="color: red;">*</span></label>
                        <select name="topicId" class="form-select" id="topicSelect1" required>
                            <g:each in="${subscribedTopics}" var="topic">
                                <option value="${topic.id}">${topic.name} (${topic.visibility})</option>
                            </g:each>
                        </select>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Share</button>
                </div>
            </div>
        </div>
    </div>
</form>

<!-- Modal -->
<form action="/topicOperations/createTopic" method="POST">
    <div class="modal fade" id="Create_Topic" tabindex="-1" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5">Create Topic</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>

                <div class="modal-body">
                    <div class="modal-form-group">
                        <label for="Name1">Topic Name<span style="color: red;">*</span></label>
                        <input type="text" class="form-control" id="Name1" name="name" placeholder="Name" required maxlength="250">
                    </div>
                </div>

                <div class="modal-footer">
                    <div class="col-2">
                        Visibility<span style="color: red;">*</span>
                    </div>

                    <div class="col">
                        <select name="visibility" class="form-select" required>
                            <option value="PRIVATE">Private</option>
                            <option value="PUBLIC">Public</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary">Create</button>
                </div>
            </div>
        </div>
    </div>
</form>

%{--<div class="modal fade" id="Create_Topic" tabindex="-1" aria-labelledby="exampleModalLabel"--}%
%{--     aria-hidden="true">--}%
%{--    <div class="modal-dialog">--}%
%{--        <div class="modal-content">--}%
%{--            <div class="modal-header">--}%
%{--                <h1 class="modal-title fs-5" id="exampleModalLabel3">Create Topic</h1>--}%
%{--                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>--}%
%{--            </div>--}%

%{--            <div class="modal-body">--}%
%{--                <div class="modal-form-group ">--}%
%{--                    <label for="exampleFirstName">Topic Name*</label>--}%
%{--                    <input type="text" class="form-control" id="Name1" placeholder="Name">--}%
%{--                </div>--}%
%{--            </div>--}%

%{--            <div class="modal-footer">--}%
%{--                <div class="col-2">--}%
%{--                    Visibility*--}%
%{--                </div>--}%

%{--                <div class="col">--}%
%{--                    <a class="btn btn-primary dropdown-toggle" href="#" role="button"--}%
%{--                       data-bs-toggle="dropdown"--}%
%{--                       aria-expanded="false">--}%
%{--                        Private--}%
%{--                    </a>--}%
%{--                    <ul class="dropdown-menu">--}%
%{--                        <li><a class="dropdown-item" href="#">Private</a></li>--}%
%{--                        <li><a class="dropdown-item" href="#">Public</a></li>--}%
%{--                    </ul>--}%
%{--                </div>--}%
%{--                <button type="button" class="btn btn-primary">Create</button>--}%
%{--            </div>--}%
%{--        </div>--}%
%{--    </div>--}%
%{--</div>--}%
