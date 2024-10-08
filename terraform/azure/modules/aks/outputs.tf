resource "local_file" "kubeconfig" {
  depends_on = [azurerm_kubernetes_cluster.kubernetes_cluster]
  filename   = "kubeconfig"
  content    = azurerm_kubernetes_cluster.kubernetes_cluster.kube_config_raw
}

output "aks_kubelet" {
  value     = azurerm_kubernetes_cluster.kubernetes_cluster.kubelet_identity
  sensitive = true
}
