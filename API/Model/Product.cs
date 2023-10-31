using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;

namespace API.Model
{
    public partial class Product
    {
        public Product()
        {
            Libraries = new HashSet<Library>();
            ProductGenres = new HashSet<ProductGenre>();
            ProductImages = new HashSet<ProductImage>();
        }

        public int ProductId { get; set; }
        public string? ProductName { get; set; }
        public string? ProductDescription { get; set; }
        public decimal? ProductPrice { get; set; }
        public int? ProductPublisher { get; set; }
        public int? ProductDeveloper { get; set; }
        public int? ProductStatus { get; set; }
        [JsonIgnore]
        public virtual Developer? ProductDeveloperNavigation { get; set; }
        [JsonIgnore]
        public virtual Publisher? ProductPublisherNavigation { get; set; }
        [JsonIgnore]
        public virtual Status? ProductStatusNavigation { get; set; }
        [JsonIgnore]
        public virtual ICollection<Library> Libraries { get; set; }
        [JsonIgnore]
        public virtual ICollection<ProductGenre> ProductGenres { get; set; }
        [JsonIgnore]
        public virtual ICollection<ProductImage> ProductImages { get; set; }
    }
}
