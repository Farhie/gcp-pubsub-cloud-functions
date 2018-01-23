resource "google_pubsub_topic" "ingress_buffer" {
  name    = "ingress-topic"
  project = "${var.project}"
}
