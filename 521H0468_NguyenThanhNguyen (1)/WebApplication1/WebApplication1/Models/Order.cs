namespace WebApplication1.Models
{
    public class Order
    {
        public int Id { get; set; }
        public int TotalPrice { get; set; }
        public ICollection<OrderDetail> orderDetail;
    }
}
