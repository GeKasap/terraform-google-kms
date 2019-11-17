resource "google_kms_key_ring" "dp_key_ring" {
  name = "${var.name}-ring"
  location = var.location
  project = var.project
}

resource "google_kms_crypto_key" "dp_key" {
  key_ring = google_kms_key_ring.dp_key_ring.self_link
  name = var.name
}

resource "google_kms_crypto_key_iam_member" "dp_key_member" {
  count = length(var.service_account)
  crypto_key_id = google_kms_crypto_key.dp_key.self_link
  member = "serviceAccount:${var.service_account[count.index]}"
  role = "roles/owner"
}

resource "google_kms_key_ring_iam_member" "dp_keyring_member" {
  count = length(var.service_account)
  key_ring_id = google_kms_key_ring.dp_key_ring.self_link
  member = "serviceAccount:${var.service_account[count.index]}"
  role = "roles/owner"
}