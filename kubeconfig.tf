data "aws_eks_cluster" "cluster" {
  depends_on = [module.eks]
  name = module.eks.cluster_name
}

data "aws_eks_cluster_auth" "cluster" {
  depends_on = [module.eks]
  name = module.eks.cluster_name
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  token                  = data.aws_eks_cluster_auth.cluster.token
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
}

resource "kubernetes_namespace" "superset" {
  metadata {
    name = "superset"
  }
}

resource "kubernetes_deployment" "superset" {
  metadata {
    name      = "superset"
    namespace = kubernetes_namespace.superset.metadata[0].name
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "superset"
      }
    }

    template {
      metadata {
        labels = {
          app = "superset"
        }
      }

      spec {
        container {
          image = "httpd"
          name  = "superset"

          port {
            container_port = 8088
            protocol       = "TCP"  
	}

          env {
            name  = "SUPERSET_ENV"
            value = "prod"
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "superset" {
  metadata {
    name      = "superset"
    namespace = kubernetes_namespace.superset.metadata[0].name
  }

  spec {
    selector = {
      app = "superset"
    }

    port {
      port        = 80
      target_port = 8088
      protocol    = "TCP"
}

    type = "LoadBalancer"
  }
}

