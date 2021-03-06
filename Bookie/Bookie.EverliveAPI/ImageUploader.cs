﻿namespace Bookie.EverliveAPI
{
    using System;
    using System.IO;
    using Bookie.Common;
    using Bookie.EverliveAPI.Contracts;
    using Telerik.Everlive.Sdk.Core;
    using Telerik.Everlive.Sdk.Core.Query.Definition.FormData;

    public class ImageUploader : IImageUploader
    {
        private readonly EverliveApp app;

        public ImageUploader()
            : this(new EverliveApp(ConnectionStrings.EverliveAppKey))
        {
        }

        public ImageUploader(EverliveApp everliveApp)
        {
            this.app = everliveApp;
        }

        public string UrlFromBase64Image(string base64)
        {
            var stream = new MemoryStream(Convert.FromBase64String(base64));
            var uploadResult = this.app.WorkWith().Files().Upload(new FileField("Url", Guid.NewGuid().ToString(), "image/jpeg", stream)).ExecuteSync();
            var url = this.app.WorkWith().Files().GetFileDownloadUrl(uploadResult.Id);
            return url;
        }

        public string UrlFromMemoryStream(MemoryStream imageStream)
        {
            var uploadResult = this.app.WorkWith().Files().Upload(new FileField("Url", Guid.NewGuid().ToString(), "image/jpeg", imageStream)).ExecuteSync();
            return this.app.WorkWith().Files().GetFileDownloadUrl(uploadResult.Id);
        }
    }
}